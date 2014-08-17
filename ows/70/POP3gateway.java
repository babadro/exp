// NOTE: Compiled JAR file should go in your classpath
import coldfusion.eventgateway.CFEvent;
import coldfusion.eventgateway.Gateway;
import coldfusion.eventgateway.GatewayServices;
import coldfusion.server.ServiceRuntimeException;
import coldfusion.eventgateway.Logger;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class POP3Gateway implements Gateway
{

    private GatewayServices gatewayService = null;
    private String gatewayID = "";
    private String[] listeners = null;
    private String config = null;
    private Thread listenerThread = null;
    private boolean shutdown = false;
    private int status = STOPPED;

    private String hostname = null;
  private String username = null;
  private String password = null;

    private long pollingInterval = 60000;
  private long listenerThreadWait = 10000;

  private Logger logger = null;

    public POP3Gateway(String gatewayID, String config)
    {
        this.gatewayID = gatewayID;
        this.config = config;
        this.gatewayService = GatewayServices.getGatewayServices();
    this.logger = gatewayService.getLogger("pop3");
    this.loadPropertiesFromFile();
    this.logger.info("POP3Gateway(" + gatewayID + "," + config + ").constructor: complete");
    }

    public String outgoingMessage(coldfusion.eventgateway.CFEvent cfmsg)
  {
    return "We have no outgoing messages from this gateway.";
  }

  public void setCFCListeners(String[] listeners)
    {
        this.listeners = listeners;
    }

    public coldfusion.eventgateway.GatewayHelper getHelper()
    {
        return null;
    }

    public void setGatewayID(String id)
    {
        gatewayID = id;
    }

    public String getGatewayID()
    {
        return gatewayID;
    }

    public void start()
    {
    this.logger.info("POP3Gateway.start():enter");
        this.status = STARTING;

        // Start up listener thread
        Runnable r = new Runnable()
        {
            public void run()
            {
                pollForNewMessages();
            }
        };
        this.listenerThread = new Thread(r);
        this.shutdown = false;
        this.listenerThread.start();

        this.status = RUNNING;
    this.logger.info("POP3Gateway.start():exit");
    }

    public void stop()
    {
    this.logger.info("POP3Gateway.stop():enter");
        this.status = STOPPING;

        this.shutdown = true;
        try
        {
            listenerThread.interrupt();
            listenerThread.join(this.listenerThreadWait);
        }
        catch (InterruptedException e)
        {
            // ignore
        }
        this.status = STOPPED;
    this.logger.info("POP3Gateway.stop():exit");
    }

  public void restart()
    {
        stop();
        loadPropertiesFromFile();
        start();
    }

    public int getStatus()
    {
        return status;
    }

    private void loadPropertiesFromFile() throws ServiceRuntimeException
    {

    this.logger.info("POP3Gateway.loadPropertiesFromFile():enter");

        Properties properties = new Properties();

        try
        {
            FileInputStream propsFile = new FileInputStream(config);
            properties.load(propsFile);
            propsFile.close();
        }
        catch (IOException e)
        {
            String error = "POP3Gateway (" + gatewayID + ") Unable to load configuration file";
            throw new ServiceRuntimeException(error, e);
        }

        this.hostname = properties.getProperty("hostname");
    this.username = properties.getProperty("username");
    this.password = properties.getProperty("password");

    this.logger.info("POP3Gateway.loadPropertiesFromFile():exit");
    }

    private void pollForNewMessages()
    {
    this.logger.info("POP3Gateway.pollForNewMessages():enter");
        int lastMessageCount = 0;
    Store store = null;
    Folder folder = null;

    try 
    {
      Properties properties = new Properties();
      Session session = Session.getDefaultInstance(properties, null);
       store = session.getStore("pop3");
      store.connect(hostname, username, password);
    }
    catch (javax.mail.MessagingException e)
    {
      throw new ServiceRuntimeException(e.getMessage());
    }

    while (!shutdown)
    {
      this.logger.info("POP3Gateway.pollForNewMessages():testing for mail");
      int newMessageCount = 0;
      try 
      {
        folder = store.getFolder("INBOX");
        folder.open(Folder.READ_ONLY);
        newMessageCount = folder.getMessageCount();
        folder.close(false);
      }
      catch (javax.mail.MessagingException e)
      {
        throw new ServiceRuntimeException(e.getMessage());
      }
      this.logger.info("POP3Gateway.pollForNewMessages():new message count=" + newMessageCount);

      if (lastMessageCount != newMessageCount) 
      {
        this.logger.info("POP3Gateway.pollForNewMessages(): lastMessageCount==" + lastMessageCount + "; newMessageCount==" + newMessageCount);
        this.sendMessageCountToCF(newMessageCount-lastMessageCount);
      }

      lastMessageCount = newMessageCount;

      try
      {
        Thread.sleep(this.pollingInterval);
      }
      catch (InterruptedException e)
      {
        //  ignore
      }
    }

    try 
    {
      folder.close(false);
    }
    catch (Exception e)
    {}

    this.logger.info("POP3Gateway.pollForNewMessages():exit");
  }

    private void sendMessageCountToCF(int newMessageCount)
    {
    this.logger.info("POP3Gateway.sendMessageCountToCF(" + newMessageCount + "):enter");
        CFEvent cfEvent = new CFEvent(gatewayID);
        cfEvent.setCfcMethod("newMailCount");

        Hashtable returnedData = new Hashtable();
        returnedData.put("NEWMAILCOUNT", Integer.toString(newMessageCount));
        cfEvent.setData(returnedData);

        cfEvent.setGatewayType("POP3Gateway");
        cfEvent.setOriginatorID("POP3Gateway");

        // Send to each listener
        for (int i = 0; i < listeners.length; i++)
        {
            // Set CFC path
            cfEvent.setCfcPath(listeners[i]);

            // send it to the event service
            gatewayService.addEvent(cfEvent);
        }
    this.logger.info("POP3Gateway.sendMessageCountToCF(" + newMessageCount + "):exit");
    }
}

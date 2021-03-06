﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.3607
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Serialization;

// 
// This source code was auto-generated by wsdl, Version=2.0.50727.42.
// 


/// <remarks/>
[System.CodeDom.Compiler.GeneratedCodeAttribute("wsdl", "2.0.50727.42")]
[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Web.Services.WebServiceBindingAttribute(Name="document.cfcSoapBinding", Namespace="http://services.cfide")]
public partial class DocumentService : System.Web.Services.Protocols.SoapHttpClientProtocol {
    
    private System.Threading.SendOrPostCallback generateOperationCompleted;
    
    /// <remarks/>
    public DocumentService() {
        this.Url = "http://localhost/CFIDE/services/document.cfc";
    }
    
    /// <remarks/>
    public event generateCompletedEventHandler generateCompleted;
    
    /// <remarks/>
    [System.Web.Services.Protocols.SoapDocumentMethodAttribute("", RequestNamespace="http://services.cfide", ResponseNamespace="http://services.cfide", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
    [return: System.Xml.Serialization.XmlElementAttribute("generateReturn")]
    public string generate(
                string serviceusername, 
                string servicepassword, 
                string format, 
                string content, 
                string authpassword, 
                string authuser, 
                string backgroundvisible, 
                string bookmark, 
                string encryption, 
                string fontembed, 
                string marginbottom, 
                string marginleft, 
                string marginright, 
                string margintop, 
                string mimetype, 
                string orientation, 
                string ownerpassword, 
                string pageheight, 
                string pagetype, 
                string pagewidth, 
                string permissions, 
                string proxyhost, 
                string proxypassword, 
                string proxyport, 
                string proxyuser, 
                string src, 
                string scale, 
                string unit, 
                string useragent, 
                string userpassword, 
                [System.Xml.Serialization.XmlElementAttribute("documentsection")] Documentsection[] documentsection, 
                [System.Xml.Serialization.XmlElementAttribute("documentitem")] Documentitem[] documentitem) {
        object[] results = this.Invoke("generate", new object[] {
                    serviceusername,
                    servicepassword,
                    format,
                    content,
                    authpassword,
                    authuser,
                    backgroundvisible,
                    bookmark,
                    encryption,
                    fontembed,
                    marginbottom,
                    marginleft,
                    marginright,
                    margintop,
                    mimetype,
                    orientation,
                    ownerpassword,
                    pageheight,
                    pagetype,
                    pagewidth,
                    permissions,
                    proxyhost,
                    proxypassword,
                    proxyport,
                    proxyuser,
                    src,
                    scale,
                    unit,
                    useragent,
                    userpassword,
                    documentsection,
                    documentitem});
        return ((string)(results[0]));
    }
    
    /// <remarks/>
    public System.IAsyncResult Begingenerate(
                string serviceusername, 
                string servicepassword, 
                string format, 
                string content, 
                string authpassword, 
                string authuser, 
                string backgroundvisible, 
                string bookmark, 
                string encryption, 
                string fontembed, 
                string marginbottom, 
                string marginleft, 
                string marginright, 
                string margintop, 
                string mimetype, 
                string orientation, 
                string ownerpassword, 
                string pageheight, 
                string pagetype, 
                string pagewidth, 
                string permissions, 
                string proxyhost, 
                string proxypassword, 
                string proxyport, 
                string proxyuser, 
                string src, 
                string scale, 
                string unit, 
                string useragent, 
                string userpassword, 
                Documentsection[] documentsection, 
                Documentitem[] documentitem, 
                System.AsyncCallback callback, 
                object asyncState) {
        return this.BeginInvoke("generate", new object[] {
                    serviceusername,
                    servicepassword,
                    format,
                    content,
                    authpassword,
                    authuser,
                    backgroundvisible,
                    bookmark,
                    encryption,
                    fontembed,
                    marginbottom,
                    marginleft,
                    marginright,
                    margintop,
                    mimetype,
                    orientation,
                    ownerpassword,
                    pageheight,
                    pagetype,
                    pagewidth,
                    permissions,
                    proxyhost,
                    proxypassword,
                    proxyport,
                    proxyuser,
                    src,
                    scale,
                    unit,
                    useragent,
                    userpassword,
                    documentsection,
                    documentitem}, callback, asyncState);
    }
    
    /// <remarks/>
    public string Endgenerate(System.IAsyncResult asyncResult) {
        object[] results = this.EndInvoke(asyncResult);
        return ((string)(results[0]));
    }
    
    /// <remarks/>
    public void generateAsync(
                string serviceusername, 
                string servicepassword, 
                string format, 
                string content, 
                string authpassword, 
                string authuser, 
                string backgroundvisible, 
                string bookmark, 
                string encryption, 
                string fontembed, 
                string marginbottom, 
                string marginleft, 
                string marginright, 
                string margintop, 
                string mimetype, 
                string orientation, 
                string ownerpassword, 
                string pageheight, 
                string pagetype, 
                string pagewidth, 
                string permissions, 
                string proxyhost, 
                string proxypassword, 
                string proxyport, 
                string proxyuser, 
                string src, 
                string scale, 
                string unit, 
                string useragent, 
                string userpassword, 
                Documentsection[] documentsection, 
                Documentitem[] documentitem) {
        this.generateAsync(serviceusername, servicepassword, format, content, authpassword, authuser, backgroundvisible, bookmark, encryption, fontembed, marginbottom, marginleft, marginright, margintop, mimetype, orientation, ownerpassword, pageheight, pagetype, pagewidth, permissions, proxyhost, proxypassword, proxyport, proxyuser, src, scale, unit, useragent, userpassword, documentsection, documentitem, null);
    }
    
    /// <remarks/>
    public void generateAsync(
                string serviceusername, 
                string servicepassword, 
                string format, 
                string content, 
                string authpassword, 
                string authuser, 
                string backgroundvisible, 
                string bookmark, 
                string encryption, 
                string fontembed, 
                string marginbottom, 
                string marginleft, 
                string marginright, 
                string margintop, 
                string mimetype, 
                string orientation, 
                string ownerpassword, 
                string pageheight, 
                string pagetype, 
                string pagewidth, 
                string permissions, 
                string proxyhost, 
                string proxypassword, 
                string proxyport, 
                string proxyuser, 
                string src, 
                string scale, 
                string unit, 
                string useragent, 
                string userpassword, 
                Documentsection[] documentsection, 
                Documentitem[] documentitem, 
                object userState) {
        if ((this.generateOperationCompleted == null)) {
            this.generateOperationCompleted = new System.Threading.SendOrPostCallback(this.OngenerateOperationCompleted);
        }
        this.InvokeAsync("generate", new object[] {
                    serviceusername,
                    servicepassword,
                    format,
                    content,
                    authpassword,
                    authuser,
                    backgroundvisible,
                    bookmark,
                    encryption,
                    fontembed,
                    marginbottom,
                    marginleft,
                    marginright,
                    margintop,
                    mimetype,
                    orientation,
                    ownerpassword,
                    pageheight,
                    pagetype,
                    pagewidth,
                    permissions,
                    proxyhost,
                    proxypassword,
                    proxyport,
                    proxyuser,
                    src,
                    scale,
                    unit,
                    useragent,
                    userpassword,
                    documentsection,
                    documentitem}, this.generateOperationCompleted, userState);
    }
    
    private void OngenerateOperationCompleted(object arg) {
        if ((this.generateCompleted != null)) {
            System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
            this.generateCompleted(this, new generateCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
        }
    }
    
    /// <remarks/>
    public new void CancelAsync(object userState) {
        base.CancelAsync(userState);
    }
}

/// <remarks/>
[System.CodeDom.Compiler.GeneratedCodeAttribute("wsdl", "2.0.50727.42")]
[System.SerializableAttribute()]
[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Xml.Serialization.XmlTypeAttribute(Namespace="http://services.cfide")]
public partial class Documentsection {
    
    private string authpasswordField;
    
    private string authuserField;
    
    private string contentField;
    
    private Documentitem[] documentitemField;
    
    private string marginbottomField;
    
    private string marginleftField;
    
    private string marginrightField;
    
    private string margintopField;
    
    private string mimetypeField;
    
    private string nameField;
    
    private string srcField;
    
    private string useragentField;
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string authpassword {
        get {
            return this.authpasswordField;
        }
        set {
            this.authpasswordField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string authuser {
        get {
            return this.authuserField;
        }
        set {
            this.authuserField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string content {
        get {
            return this.contentField;
        }
        set {
            this.contentField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlArrayAttribute(IsNullable=true)]
    [System.Xml.Serialization.XmlArrayItemAttribute("item", Namespace="http://rpc.xml.coldfusion", IsNullable=false)]
    public Documentitem[] documentitem {
        get {
            return this.documentitemField;
        }
        set {
            this.documentitemField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string marginbottom {
        get {
            return this.marginbottomField;
        }
        set {
            this.marginbottomField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string marginleft {
        get {
            return this.marginleftField;
        }
        set {
            this.marginleftField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string marginright {
        get {
            return this.marginrightField;
        }
        set {
            this.marginrightField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string margintop {
        get {
            return this.margintopField;
        }
        set {
            this.margintopField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string mimetype {
        get {
            return this.mimetypeField;
        }
        set {
            this.mimetypeField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string name {
        get {
            return this.nameField;
        }
        set {
            this.nameField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string src {
        get {
            return this.srcField;
        }
        set {
            this.srcField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string useragent {
        get {
            return this.useragentField;
        }
        set {
            this.useragentField = value;
        }
    }
}

/// <remarks/>
[System.CodeDom.Compiler.GeneratedCodeAttribute("wsdl", "2.0.50727.42")]
[System.SerializableAttribute()]
[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
[System.Xml.Serialization.XmlTypeAttribute(Namespace="http://services.cfide")]
public partial class Documentitem {
    
    private string contentField;
    
    private string typeField;
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string content {
        get {
            return this.contentField;
        }
        set {
            this.contentField = value;
        }
    }
    
    /// <remarks/>
    [System.Xml.Serialization.XmlElementAttribute(IsNullable=true)]
    public string type {
        get {
            return this.typeField;
        }
        set {
            this.typeField = value;
        }
    }
}

/// <remarks/>
[System.CodeDom.Compiler.GeneratedCodeAttribute("wsdl", "2.0.50727.42")]
public delegate void generateCompletedEventHandler(object sender, generateCompletedEventArgs e);

/// <remarks/>
[System.CodeDom.Compiler.GeneratedCodeAttribute("wsdl", "2.0.50727.42")]
[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.ComponentModel.DesignerCategoryAttribute("code")]
public partial class generateCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
    
    private object[] results;
    
    internal generateCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
            base(exception, cancelled, userState) {
        this.results = results;
    }
    
    /// <remarks/>
    public string Result {
        get {
            this.RaiseExceptionIfNecessary();
            return ((string)(this.results[0]));
        }
    }
}

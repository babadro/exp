<cfdirectory name="files" action="list" directory="#ExpandPath('./')#" filter="*.cfm" />
<h1>Chapter 29 Files</h1>
<cfoutput query="files">
  <a href="#name#">#name#</a><br />
</cfoutput>
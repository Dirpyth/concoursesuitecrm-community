<%@ taglib uri="/WEB-INF/dhv-taglib.tld" prefix="dhv" %>
<%@ page import="java.util.*,com.zeroio.iteam.base.*,org.aspcfs.modules.base.accounts.*" %>
<jsp:useBean id="OrgDetails" class="org.aspcfs.modules.accounts.base.Organization" scope="request"/>
<jsp:useBean id="FileFolder" class="com.zeroio.iteam.base.FileFolder" scope="request"/>
<jsp:useBean id="folderHierarchy" class="com.zeroio.iteam.base.FileFolderHierarchy" scope="request"/>
<%@ include file="../initPage.jsp" %>
<table cellpadding="0" cellspacing="0" width="100%" border="0">
<tr>
  <td>
    Select a folder to move the item to:<br>
    <img src="images/icons/stock_folder-16-19.gif" border="0" align="absmiddle">
    <%= toHtml(FileFolder.getSubject()) %>
  </td>
</tr>
</table>
&nbsp;<br>
<table cellpadding="0" cellspacing="0" width="100%" border="1" rules="cols">
  <tr class="section">
    <td valign="top" width="100%">
      <img alt="" src="images/tree7o.gif" border="0" align="absmiddle" height="16" width="19"/>
      <img alt="" src="images/icons/stock_open-16-19.gif" border="0" align="absmiddle" height="16" width="19"/>
    <dhv:evaluate if="<%= FileFolder.getParentId() != -1 %>">
      <a href="AccountsDocumentsFolders.do?command=SaveMove&orgId=<%= OrgDetails.getOrgId() %>&id=<%= FileFolder.getId() %>&popup=true&folderId=0&return=AccountsDocuments&param=<%= OrgDetails.getOrgId() %>&param2=<%= FileFolder.getParentId() %>">Home</a>
    </dhv:evaluate>
    <dhv:evaluate if="<%= FileFolder.getParentId() == -1 %>">
      Home
      (current folder)
    </dhv:evaluate>
    </td>
  </tr>
<%
  int rowid = 0;
  Iterator i = folderHierarchy.getHierarchy().iterator();
  while (i.hasNext()) {
    rowid = (rowid != 1?1:2);
    FileFolder thisFolder = (FileFolder) i.next();
%>    
  <tr class="row<%= rowid %>">
    <td valign="top">
      <img border="0" src="images/treespace.gif" align="absmiddle" height="16" width="19">
      <img alt="" src="images/tree7o.gif" border="0" align="absmiddle" height="16" width="19"/>
      <img border="0" src="images/icons/stock_open-16-19.gif" align="absmiddle">
    <dhv:evaluate if="<%= FileFolder.getParentId() != thisFolder.getId() %>">  
      <a href="AccountsDocumentsFolders.do?command=SaveMove&orgId=<%= OrgDetails.getId() %>&id=<%= FileFolder.getId() %>&popup=true&folderId=<%= thisFolder.getId() %>&return=AccountsDocuments&param=<%= OrgDetails.getOrgId() %>&param2=<%= FileFolder.getParentId() %>"><%= toHtml(thisFolder.getSubject()) %></a>
    </dhv:evaluate>
    <dhv:evaluate if="<%= FileFolder.getParentId() == thisFolder.getId() %>">
      <%= toHtml(thisFolder.getSubject()) %>
      (current folder)
    </dhv:evaluate>
    </td>
  </tr>
<%
  }
%>
</table>
&nbsp;<br>
<input type="button" value="Cancel" onClick="javascript:window.close()">
<%-- 
  - Copyright(c) 2004 Concursive Corporation (http://www.concursive.com/) All
  - rights reserved. This material cannot be distributed without written
  - permission from Concursive Corporation. Permission to use, copy, and modify
  - this material for internal use is hereby granted, provided that the above
  - copyright notice and this permission notice appear in all copies. CONCURSIVE
  - CORPORATION MAKES NO REPRESENTATIONS AND EXTENDS NO WARRANTIES, EXPRESS OR
  - IMPLIED, WITH RESPECT TO THE SOFTWARE, INCLUDING, BUT NOT LIMITED TO, THE
  - IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR ANY PARTICULAR
  - PURPOSE, AND THE WARRANTY AGAINST INFRINGEMENT OF PATENTS OR OTHER
  - INTELLECTUAL PROPERTY RIGHTS. THE SOFTWARE IS PROVIDED "AS IS", AND IN NO
  - EVENT SHALL CONCURSIVE CORPORATION OR ANY OF ITS AFFILIATES BE LIABLE FOR
  - ANY DAMAGES, INCLUDING ANY LOST PROFITS OR OTHER INCIDENTAL OR CONSEQUENTIAL
  - DAMAGES RELATING TO THE SOFTWARE.
  - 
  - Version: $Id$
  - Description: 
  --%>
<%@ taglib uri="/WEB-INF/dhv-taglib.tld" prefix="dhv" %>
<%@ page import="java.util.*,org.aspcfs.modules.help.base.*" %>
<jsp:useBean id="Note" class="org.aspcfs.modules.help.base.HelpNote" scope="request"/>
<%@ include file="../initPage.jsp" %>
<script language="JavaScript">
function validate() {
    formTest = true;
    message = "";
    if(document.saveNote.description.value == ""){
		    message += label("description.required","- Description is required\r\n");
        formTest = false;
    }
    
    if (formTest) {
      return true;
    } else {
      alert(label("check.form", "Form could not be saved, please check the following:\r\n\r\n") + message);
      return false;
    }
  }
</script>
<body onLoad="javascript:document.saveNote.description.focus();">
<form name="saveNote" action="HelpNotes.do?command=SaveNote&id=<%= Note.getId() %>&auto-populate=true" method="post" onSubmit="return validate();">
<table cellpadding="4" cellspacing="0" width="100%" class="details">
<tr>
  <th colspan="2">
    <strong><dhv:label name="qa.note">Note</dhv:label></strong>
  </th>
</tr>
<tr class="containerBody">
  <td class="formLabel">
    <dhv:label name="accounts.accountasset_include.Description">Description</dhv:label>
  </td>
  <td>
    <input type="text" name="description" value="<%= Note.getDescription() != null ?  toHtml(Note.getDescription()) : ""%>" size="60">
   </td>
</tr>
<tr class="containerBody">
  <td class="formLabel">
    <dhv:label name="global.button.complete">Complete</dhv:label>
  </td>
  <td>
    <input type="checkbox" name="complete" value="true" <%= Note.getComplete() ?  " checked" : ""%>>
   </td>
</tr>
</table><br>
<dhv:label name="qa.whereDoYouWantToGo.question">Where do you want to go after this action?</dhv:label><br>
<input type="radio" name="target" value="loop" <%= "loop".equals(request.getParameter("target")) ? " checked" : "" %>>&nbsp;<dhv:label name="qa.addAnotherFeature">Add another feature</dhv:label>&nbsp;&nbsp;
<input type="radio" name="target" value="return" <%= "loop".equals(request.getParameter("target")) ? "" : " checked" %>>&nbsp;<dhv:label name="qa.returnToQAPage">Return to QA Page</dhv:label>
<br><br>
<dhv:evaluate if="<%= Note.getId() > 0 %>">
  <input type="hidden" name="modified" value="<%= Note.getModified() %>">
</dhv:evaluate>
<%= addHiddenParams(request, "popup|linkHelpId") %>
<input type="submit" value="<dhv:label name="global.button.save">Save</dhv:label>">
<input type="button" value="<dhv:label name="global.button.cancel">Cancel</dhv:label>" onClick="javascript:window.close();">
</form>
</body>

<%@ taglib uri="/WEB-INF/dhv-taglib.tld" prefix="dhv" %>
<jsp:useBean id="UserList" class="org.aspcfs.modules.admin.base.UserList" scope="request"/>
<jsp:useBean id="RoleList" class="org.aspcfs.modules.RoleList" scope="request"/>
<jsp:useBean id="UserRecord" class="org.aspcfs.modules.admin.base.User" scope="request"/>
<%@ include file="../initPage.jsp" %>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" SRC="javascript/checkDate.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" SRC="javascript/popCalendar.js"></SCRIPT>
<body onLoad="javascript:document.forms[0].username.focus();">
<form name="details" action="Users.do?command=UpdateUser&auto-populate=true" method="post">
<a href="Admin.do">Setup</a> > 
<% if (request.getParameter("return") != null) {%>
	<% if (request.getParameter("return").equals("list")) {%>
	<a href="Users.do?command=ListUsers">View Users</a> >
  <%}%>
<%} else {%>
<a href="Users.do?command=ListUsers">View Users</a> >
<a href="Users.do?command=UserDetails&id=<%=UserRecord.getId()%>">User Details</a> >
<%}%>
Modify User<br>
<hr color="#BFBFBB" noshade>

<table cellpadding="4" cellspacing="0" border="1" width="100%" bordercolorlight="#000000" bordercolor="#FFFFFF">
  <tr class="containerHeader">
    <td>
      <strong><%= toHtml(UserRecord.getUsername()) %> (<%= toHtml(UserRecord.getContact().getNameLastFirst()) %>)</strong>
    </td>
  </tr>
  <tr class="containerMenu">
    <td>
      <% String param1 = "id=" + UserRecord.getId(); %>      
      <dhv:container name="users" selected="details" param="<%= param1 %>" />
    </td>
  </tr>
  <tr>
    <td class="containerBack">

<% if (request.getParameter("return") != null) {%>
<input type="hidden" name="return" value="<%=request.getParameter("return")%>">
<%}%>

<input type=submit value="Update">

<% if (request.getParameter("return") != null) {%>
	<% if (request.getParameter("return").equals("list")) {%>
	<input type=submit value="Cancel" onClick="javascript:this.form.action='Users.do?command=ListUsers'">
	<%}%>
<%} else {%>
<input type=submit value="Cancel" onClick="javascript:this.form.action='Users.do?command=UserDetails&id=<%=UserRecord.getId()%>'">
<%}%>
<input type=submit value="Disable" onClick="javascript:this.form.action='Users.do?command=DisableUserConfirm&id=<%=UserRecord.getId()%>'">
<br>
<input type="hidden" name="id" value="<%= UserRecord.getId() %>">
<input type="hidden" name="contactId" value="<%= UserRecord.getContactId() %>">
<input type="hidden" name="previousUsername" value="<%= ((UserRecord.getPreviousUsername() == null)?UserRecord.getUsername():UserRecord.getPreviousUsername()) %>">
<%= showError(request, "actionError") %>
<table cellpadding="4" cellspacing="0" border="1" width="100%" bordercolorlight="#000000" bordercolor="#FFFFFF">
  <tr class="title">
    <td colspan=2 valign=center align=left>
	    <strong>Modify Primary Information</strong>
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">Unique Username</td>
    <td>
      <input type="text" name="username" value="<%= toHtmlValue(UserRecord.getUsername()) %>">
      <font color=red>*</font> <%= showAttribute(request, "usernameError") %>
    </td>
  </tr>
  <!--tr><td width="150">Password</td><td><input type="password" name="password1" value="<%= toHtmlValue(UserRecord.getPassword()) %>"><font color=red>*</font> <%= showAttribute(request, "password1Error") %></td></tr>
  <tr><td width="150">Type password again</td><td><input type="password" name="password2" value="<%= toHtmlValue(UserRecord.getPassword()) %>"><font color=red>*</font> <%= showAttribute(request, "password2Error") %></td></tr-->
  <tr class="containerBody">
    <td nowrap class="formLabel">Role (User Group)</td>
    <td>
      <%= RoleList.getHtmlSelect("roleId", UserRecord.getRoleId()) %>
      <font color="red">*</font> <%= showAttribute(request, "roleError") %>
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">Reports To</td>
    <td>
      <%= UserList.getHtmlSelect("managerId", UserRecord.getManagerId()) %>
      <%= showAttribute(request, "managerIdError") %>
    </td>
  </tr>
  
    <tr class="containerBody">
    <td nowrap class="formLabel">Alias User</td>
    <td>
      <%= UserList.getHtmlSelect("alias", UserRecord.getAlias()) %>
    </td>
  </tr>
  
  <tr class="containerBody">
    <td nowrap class="formLabel">Expire Date</td>
    <td>
    <input type=text size=10 name="expires" value="<%=toHtmlValue(UserRecord.getExpiresString())%>">
    <a href="javascript:popCalendar('details', 'expires');">Date</a> (mm/dd/yyyy)
    </td>
  </tr>
  
  <tr class="containerBody">
    <td nowrap class="formLabel">Generate new password</td>
    <td>
    <table border="0" cellpadding="0" cellspacing="0">
    <tr><td valign="center">
    <input type="checkbox" name="generatePass">
    </td>
    <td width="8"></td>
    <td valign="center">
    Note: New password will be emailed to the following address:
    <%=UserRecord.getContact().getEmailAddress("Business")%>
    </td>
    </tr>
    </table>
    </td>
  </tr>  

  
</table>
<br>
<input type=submit value="Update">
<% if (request.getParameter("return") != null) {%>
	<% if (request.getParameter("return").equals("list")) {%>
	<input type=submit value="Cancel" onClick="javascript:this.form.action='Users.do?command=ListUsers'">
	<%}%>
<%} else {%>
<input type=submit value="Cancel" onClick="javascript:this.form.action='Users.do?command=UserDetails&id=<%=UserRecord.getId()%>'">
<%}%>
<input type=submit value="Disable" onClick="javascript:this.form.action='Users.do?command=DisableUserConfirm&id=<%=UserRecord.getId()%>'">
  </td>
  </tr>
</table>
</form>

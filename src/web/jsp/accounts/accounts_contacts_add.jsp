<%@ taglib uri="/WEB-INF/dhv-taglib.tld" prefix="dhv" %>
<%@ page import="java.util.*,org.aspcfs.modules.accounts.base.*,org.aspcfs.utils.web.*" %>
<jsp:useBean id="OrgDetails" class="org.aspcfs.modules.accounts.base.Organization" scope="request"/>
<jsp:useBean id="ContactDetails" class="org.aspcfs.modules.contacts.base.Contact" scope="request"/>
<jsp:useBean id="ContactTypeList" class="org.aspcfs.modules.contacts.base.ContactTypeList" scope="request"/>
<jsp:useBean id="ContactPhoneTypeList" class="org.aspcfs.utils.web.LookupList" scope="request"/>
<jsp:useBean id="ContactEmailTypeList" class="org.aspcfs.utils.web.LookupList" scope="request"/>
<jsp:useBean id="ContactAddressTypeList" class="org.aspcfs.utils.web.LookupList" scope="request"/>
<jsp:useBean id="StateSelect" class="org.aspcfs.webutils.StateSelect" scope="request"/>
<jsp:useBean id="CountrySelect" class="org.aspcfs.webutils.CountrySelect" scope="request"/>
<%@ include file="../initPage.jsp" %>
<script language="JavaScript" TYPE="text/javascript" SRC="javascript/checkPhone.js"></script>
<script language="JavaScript" TYPE="text/javascript" SRC="javascript/popLookupSelect.js"></script>
<script language="JavaScript">
  function checkForm(form) {
      formTest = true;
      message = "";
      if ((!checkPhone(form.phone1number.value)) || (!checkPhone(form.phone2number.value)) || (!checkPhone(form.phone3number.value)) ) { 
        message += "- At least one entered phone number is invalid.  Make sure there are no invalid characters and that you have entered the area code\r\n";
        formTest = false;
      }
      if (formTest == false) {
        alert("Form could not be saved, please check the following:\r\n\r\n" + message);
        return false;
      } else {
        var test = document.addContact.selectedList;
        if (test != null) {
          return selectAllOptions(document.addContact.selectedList);
        }
      }
    }
</script>
<body onLoad="javascript:document.forms[0].nameFirst.focus();">
<form name="addContact" action="Contacts.do?command=Insert&auto-populate=true" method="post">
<a href="Accounts.do">Account Management</a> > 
<a href="Accounts.do?command=View">View Accounts</a> >
<a href="Accounts.do?command=Details&orgId=<%=OrgDetails.getOrgId()%>">Account Details</a> >
<a href="Contacts.do?command=View&orgId=<%=OrgDetails.getOrgId()%>">Contacts</a> >
Add Contact<br>
<hr color="#BFBFBB" noshade>
<table cellpadding="4" cellspacing="0" border="1" width="100%" bordercolorlight="#000000" bordercolor="#FFFFFF">
  <tr class="containerHeader">
    <td>
      <strong><%= toHtml(OrgDetails.getName()) %></strong>
    </td>
  </tr>
  <tr class="containerMenu">
    <td>
      <% String param1 = "orgId=" + OrgDetails.getOrgId(); %>      
      <dhv:container name="accounts" selected="contacts" param="<%= param1 %>" />
    </td>
  </tr>
  <tr>
    <td class="containerBack">
<input type="hidden" name="orgId" value="<%= request.getParameter("orgId") %>">
<input type=submit value="Save" onClick="return checkForm(this.form)">
<input type=submit value="Save & Clone" onClick="this.form.saveAndClone.value='true';return checkForm(this.form);">
<input type=reset value="Reset">
<input type="submit" value="Cancel" onClick="javascript:this.form.action='Contacts.do?command=View'">
<br>
<%= showError(request, "actionError") %>
<table cellpadding="4" cellspacing="0" border="1" width="100%" bordercolorlight="#000000" bordercolor="#FFFFFF">
  <tr class="title">
    <td colspan=2 valign=center align=left>
      <strong>Add a New Contact</strong>
    </td>     
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      Contact Type(s)
    </td>
    <td valign="center">
      <select multiple name="selectedList" id="selectedList" size="5">
        <dhv:evaluate exp="<%=ContactDetails.getTypes().isEmpty()%>">
          <option value="-1">None Selected</option>
        </dhv:evaluate>
        <dhv:evaluate exp="<%=!(ContactDetails.getTypes().isEmpty())%>">
           <%
            Iterator i = ContactDetails.getTypes().iterator();
            while (i.hasNext()) {
              LookupElement thisElt = (LookupElement)i.next();
            %>
               <option value="<%=thisElt.getCode()%>"><%=thisElt.getDescription()%></option>
            <%}%>
         </dhv:evaluate>
			</select>
      <input type="hidden" name="previousSelection" value="">
      <input type="hidden" name="category" value="<%= request.getParameter("category") %>">
      <a href="javascript:popContactTypeSelectMultiple('selectedList', 'accounts', <%= ContactDetails.getId() %>);">Select</a>
     </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      First Name
    </td>
    <td valign=center>
      <input type=text size=35 name="nameFirst" value="<%= toHtmlValue(ContactDetails.getNameFirst()) %>">
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
    Middle Name
    </td>
    <td valign=center>
      <input type=text size=35 name="nameMiddle" value="<%= toHtmlValue(ContactDetails.getNameMiddle()) %>">
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      Last Name
    </td>
    <td valign=center>
      <input type=text size=35 name="nameLast" value="<%= toHtmlValue(ContactDetails.getNameLast()) %>">
      <font color="red">*</font> <%= showAttribute(request, "nameLastError") %>
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      Title
    </td>
    <td valign=center>
      <input type=text size=35 name="title" value="<%= toHtmlValue(ContactDetails.getTitle()) %>">
    </td>
  </tr>
</table>
&nbsp;<br>  
<table cellpadding="4" cellspacing="0" border="1" width="100%" bordercolorlight="#000000" bordercolor="#FFFFFF">
  <tr class="title">
    <td valign=center align=left>
	    <strong>Email Addresses</strong>
	  </td>
  </tr>
  
<%
  int ecount = 0;
  int etotal = 2;
  Iterator enumber = ContactDetails.getEmailAddressList().iterator();
  while (enumber.hasNext()) {
    ++ecount;
    ContactEmailAddress thisEmailAddress = (ContactEmailAddress)enumber.next();
%>  
  
  <tr class="containerBody">
    <td>
      <%= ContactEmailTypeList.getHtmlSelect("email"+ecount+"type", thisEmailAddress.getType()) %>
      <input type=text size=40 name="email<%= ecount %>address" maxlength=255 value="<%= toHtmlValue(thisEmailAddress.getEmail()) %>">
    </td>
  </tr>
<%    
  }
%>  
  
<% 
  while (ecount < etotal) {
    ++ecount;
%>
  
  <tr class="containerBody">
    <td>
      <%= ContactEmailTypeList.getHtmlSelect("email" + ecount + "type", ((ContactDetails.getEmailAddressTypeId(1)==-1)?1:ContactDetails.getEmailAddressTypeId(1))) %>
      <input type=text size=40 name="email<%=ecount%>address" maxlength=255>
    </td>
  </tr>
<%
  }
%>
  
</table>
<div align="center" style="padding:3px;">Note: All international phone numbers must be preceded by a "+" symbol.</div>
<table cellpadding="4" cellspacing="0" border="1" width="100%" bordercolorlight="#000000" bordercolor="#FFFFFF">
  <tr class="title">
    <td valign=center align=left>
	    <strong>Phone Numbers</strong>
	  </td>
  </tr>
  
  
<%  
  int icount = 0;
  int itotal = 3;
  Iterator inumber = ContactDetails.getPhoneNumberList().iterator();
  
  while (inumber.hasNext()) {
    ++icount;
    ContactPhoneNumber thisPhoneNumber = (ContactPhoneNumber)inumber.next();
%>    
  <tr class="containerBody">
    <td>
      <%= ContactPhoneTypeList.getHtmlSelect("phone" + icount + "type", thisPhoneNumber.getType()) %>
      <input type=text size=20 name="phone<%= icount %>number" value="<%= toHtmlValue(thisPhoneNumber.getNumber()) %>">&nbsp;ext.
      <input type="text" size="5" name="phone<%= icount %>ext" maxlength="10" value="<%= toHtmlValue(thisPhoneNumber.getExtension()) %>">
    </td>
  </tr>    
<%    
  }
%>

<% 
  while (icount < itotal) {
    ++icount;
%>
  
  <tr class="containerBody">
    <td>
      <%= ContactPhoneTypeList.getHtmlSelect("phone"+icount+"type", "Business") %>
      <input type=text size=20 name="phone<%=icount%>number">&nbsp;ext.
      <input type=text size=5 name="phone<%=icount%>ext" maxlength=10>
    </td>
  </tr>
<%}%>  
  
  <!--tr class="containerBody">
    <td>
      <%= ContactPhoneTypeList.getHtmlSelect("phone2type", "Home") %>
      input type=text size=3 name="phone2ac" maxlength=3>-
      <input type=text size=3 name="phone2pre" maxlength=3>-
      <input type=text size=4 name="phone2number" maxlength=4>ext. 
      <input type=text size=20 name="phone2number">&nbsp;ext.
      <input type=text size=5 name="phone2ext" maxlength=10>
    </td>
  </tr>
  <tr class="containerBody">
    <td>
      <%= ContactPhoneTypeList.getHtmlSelect("phone3type", "Mobile") %>
      input type=text size=3 name="phone3ac" maxlength=3>-
      <input type=text size=3 name="phone3pre" maxlength=3>-
      <input type=text size=4 name="phone3number" maxlength=4>ext. 
      <input type=text size=20 name="phone3number">&nbsp;ext.
      <input type=text size=5 name="phone3ext" maxlength=10>
    </td>
  </tr-->
</table>
&nbsp;<br>  
<table cellpadding="4" cellspacing="0" border="1" width="100%" bordercolorlight="#000000" bordercolor="#FFFFFF">
  <tr class="title">
    <td valign=center align=left colspan="2">
      <strong>Addresses</strong>
    </td>
  </tr>
<%  
  int acount = 0;
  int atotal = 2;
  Iterator anumber = ContactDetails.getAddressList().iterator();
  while (anumber.hasNext()) {
    ++acount;
    ContactAddress thisAddress = (ContactAddress)anumber.next();
%>    
  <tr class="containerBody">
    <input type="hidden" name="address<%= acount %>id" value="<%= thisAddress.getId() %>">
    <td>
      &nbsp;
    </td>
    <td>
      <%= ContactAddressTypeList.getHtmlSelect("address" + acount + "type", thisAddress.getType()) %>
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      Address Line 1
    </td>
    <td>
      <input type=text size=40 name="address<%= acount %>line1" maxlength=80 value="<%= toHtmlValue(thisAddress.getStreetAddressLine1()) %>">
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      Address Line 2
    </td>
    <td>
      <input type=text size=40 name="address<%= acount %>line2" maxlength=80 value="<%= toHtmlValue(thisAddress.getStreetAddressLine2()) %>">
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      City
    </td>
    <td>
      <input type=text size=28 name="address<%= acount %>city" maxlength=80 value="<%= toHtmlValue(thisAddress.getCity()) %>">
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      State/Province
    </td>
    <td>
      <%=StateSelect.getHtml("address" + acount + "state", thisAddress.getState())%>
      <% StateSelect = new StateSelect(); %>
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      Zip/Postal Code
    </td>
    <td>
      <input type=text size=10 name="address<%= acount %>zip" maxlength=12 value="<%= toHtmlValue(thisAddress.getZip()) %>">
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      Country
    </td>
    <td>
      <%=CountrySelect.getHtml("address" + acount + "country", thisAddress.getCountry())%>
      <% CountrySelect = new CountrySelect(); %>
    </td>
  </tr>
  <tr class="containerBody">
    <td colspan="2">
      &nbsp;
    </td>
  </tr>
<%    
  }
%>

<% 
  while (acount < atotal) {
%>
  
  <tr class="containerBody">
    <td>
      &nbsp;
    </td>
    <td>
      <%= ContactAddressTypeList.getHtmlSelect("address" + (++acount) + "type", "Business") %>
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      Address Line 1
    </td>
    <td>
      <input type=text size=40 name="address<%= acount %>line1" maxlength=80>
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      Address Line 2
    </td>
    <td>
      <input type=text size=40 name="address<%= acount %>line2" maxlength=80>
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      City
    </td>
    <td>
      <input type=text size=28 name="address<%= acount %>city" maxlength=80>
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      State/Province
    </td>
    <td>
      <%=StateSelect.getHtml("address" + acount + "state")%>
      <% StateSelect = new StateSelect(); %>
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      Zip/Postal Code
    </td>
    <td>
      <input type=text size=10 name="address<%= acount %>zip" maxlength=12>
    </td>
  </tr>
  <tr class="containerBody">
    <td nowrap class="formLabel">
      Country
    </td>
    <td>
      <%=CountrySelect.getHtml("address" + acount + "country")%>
      <% CountrySelect = new CountrySelect(); %>
    </td>
  </tr>
  
  <% if (acount != atotal) { %>
    <tr class="containerBody">
    <td colspan="2">
      &nbsp;
    </td>
  </tr>
  <%}%>
  
<%}%>  

</table>
<br>
<input type=submit value="Save" onClick="return checkForm(this.form)">
<input type=submit value="Save & Clone" onClick="this.form.saveAndClone.value='true';return checkForm(this.form);">
<input type="reset" value="Reset">
<input type="submit" value="Cancel" onClick="javascript:this.form.action='Contacts.do?command=View'">
    </td>
  </tr>
</table>
<input type="hidden" name="saveAndClone" value="">
</form>
</body>

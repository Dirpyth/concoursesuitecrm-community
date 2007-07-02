<%--
  - Copyright(c) 2007 Dark Horse Ventures LLC (http://www.centriccrm.com/) All
  - rights reserved. This material cannot be distributed without written
  - permission from Dark Horse Ventures LLC. Permission to use, copy, and modify
  - this material for internal use is hereby granted, provided that the above
  - copyright notice and this permission notice appear in all copies. DARK HORSE
  - VENTURES LLC MAKES NO REPRESENTATIONS AND EXTENDS NO WARRANTIES, EXPRESS OR
  - IMPLIED, WITH RESPECT TO THE SOFTWARE, INCLUDING, BUT NOT LIMITED TO, THE
  - IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR ANY PARTICULAR
  - PURPOSE, AND THE WARRANTY AGAINST INFRINGEMENT OF PATENTS OR OTHER
  - INTELLECTUAL PROPERTY RIGHTS. THE SOFTWARE IS PROVIDED "AS IS", AND IN NO
  - EVENT SHALL DARK HORSE VENTURES LLC OR ANY OF ITS AFFILIATES BE LIABLE FOR
  - ANY DAMAGES, INCLUDING ANY LOST PROFITS OR OTHER INCIDENTAL OR CONSEQUENTIAL
  - DAMAGES RELATING TO THE SOFTWARE.
  -
   - Version: $Id: website_fields_list_menu.jsp 4.1 2007-05-07 14:29:28 +0530 (Mon,07 May 2007) nagarajay $
  - Description:
  --%>
<%@ taglib uri="/WEB-INF/dhv-taglib.tld" prefix="dhv" %>
<script language="javascript">

  var thisRecId = -1;
  var menu_init = false;
  //Set the action parameters for clicked item
  function displayMenu<%=randomNum%>(loc, id, recId) {
    thisRecId = recId;

    if (!menu_init) {
      menu_init = true;
      new ypSlideOutMenu("menuRow", "down", 0, 0, 170, getHeight("menuRowTable"));
      new ypSlideOutMenu("menuColumn", "down", 0, 0, 170, getHeight("menuColumnTable"));
    }
    new ypSlideOutMenu("menuField<%=randomNum%>", "down", 0, 0, 170, getHeight("menuField<%=randomNum%>Table"));
    return ypSlideOutMenu.displayDropMenu(id, loc);
  }

  //Menu link functions
  function folderDetails<%=randomNum%>() {
    window.location.href = '<portlet:renderURL><portlet:param name="viewType" value="details"/><portlet:param name="recordId" value="'+thisRecId+'"/></portlet:renderURL>';
  }

  function modify<%=randomNum%>() {
    window.location.href = '<portlet:renderURL><portlet:param name="viewType" value="edit"/><portlet:param name="recordId" value="'+thisRecId+'"/></portlet:renderURL>';
  }

  function deleteField<%=randomNum%>() {
    if (confirm(" Are you sure? ")) {
      window.location.href = '<portlet:renderURL><portlet:param name="viewType" value="delete"/><portlet:param name="recordId" value="'+thisRecId+'"/></portlet:renderURL>';
    } else {
      return false;
    }
  }

</script>

<div id="menuField<%=randomNum%>Container" class="menu">
  <div id="menuField<%=randomNum%>Content">
    <table id="menuField<%=randomNum%>Table" class="pulldown" width="170" cellspacing="0">

      <dhv:evaluate if="<%=Category.getCanView()%>">
        <tr onmouseover="cmOver(this)" onmouseout="cmOut(this)" onclick="folderDetails<%=randomNum%>()">
          <th>
            <img src="images/icons/stock_zoom-page-16.gif" border="0" align="absmiddle" height="16" width="16"/>
          </th>
          <td width="100%">
            <dhv:label name="accounts.accounts_calls_list_menu.ViewDetails">View Details</dhv:label>
          </td>
        </tr>
      </dhv:evaluate>
      <dhv:evaluate if="<%=Category.getCanEdit()%>">
        <tr onmouseover="cmOver(this)" onmouseout="cmOut(this)" onclick="modify<%=randomNum%>()">
          <th>
            <img src="images/icons/stock_edit-16.gif" border="0" align="absmiddle" height="16" width="16"/>
          </th>
          <td width="100%">
            <dhv:label name="global.button.modify">Modify</dhv:label>
          </td>
        </tr>
      </dhv:evaluate>
      <dhv:evaluate if="<%=Category.getCanDelete()%>">
        <tr onmouseover="cmOver(this)" onmouseout="cmOut(this)" onclick="deleteField<%=randomNum%>()">
          <th>
            <img src="images/icons/stock_delete-16.gif" border="0" align="absmiddle" height="16" width="16"/>
          </th>
          <td width="100%">
            <dhv:label name="global.button.delete">Delete</dhv:label>
          </td>
        </tr>
      </dhv:evaluate>
    </table>
  </div>
</div>

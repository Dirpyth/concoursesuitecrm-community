package com.darkhorseventures.cfsmodule;

import javax.servlet.*;
import javax.servlet.http.*;
import org.theseus.actions.*;
import com.darkhorseventures.cfsbase.*;
import com.darkhorseventures.utils.*;
import com.darkhorseventures.webutils.PagedListInfo;
import java.sql.*;

/**
 *  The Search module.
 *
 *@author     mrajkowski
 *@created    July 12, 2001
 *@version    $Id$
 */
public final class Search extends CFSModule {

  /**
   *  Currently does nothing important.
   *
   *@param  context  Description of Parameter
   *@return          Description of the Returned Value
   *@since
   */
  public String executeCommandSiteSearch(ActionContext context) {
    Exception errorMessage = null;

    PagedListInfo searchSiteInfo = this.getPagedListInfo(context, "SearchSiteInfo");
    searchSiteInfo.setLink("/ExternalContacts.do?command=ListContacts");

    String searchCriteria = context.getRequest().getParameter("search");

    Connection db = null;

    if (searchCriteria != null && !(searchCriteria.equals(""))) {
      searchCriteria = "%" + searchCriteria + "%";
    }

    try {
      db = this.getConnection(context);

      if (hasPermission(context, "contacts-external_contacts-view")) {
        ContactList contactList = new ContactList();
        contactList.setPersonalId(getUserId(context));
        contactList.setSearchText(searchCriteria);
        contactList.setPagedListInfo(searchSiteInfo);
        contactList.setOwnerIdRange(this.getUserRange(context));
        contactList.buildList(db);
        context.getRequest().setAttribute("ContactList", contactList);
      }

      if (hasPermission(context, "contacts-internal_contacts-view")) {
        ContactList employeeList = new ContactList();
        employeeList.setPersonalId(getUserId(context));
        employeeList.setSearchText(searchCriteria);
        employeeList.setTypeId(1);
        employeeList.buildList(db);
        context.getRequest().setAttribute("EmployeeList", employeeList);
      }

      if (hasPermission(context, "accounts-accounts-view")) {
        OrganizationList organizationList = new OrganizationList();
        organizationList.setName(searchCriteria);
        organizationList.setMinerOnly(false);
        organizationList.buildList(db);
        context.getRequest().setAttribute("OrganizationList", organizationList);
      }

      if (hasPermission(context, "pipeline-opportunities-view")) {
        OpportunityList oppList = new OpportunityList();
        oppList.setDescription(searchCriteria);
        oppList.setOwnerIdRange(this.getUserRange(context));
        oppList.buildList(db);
        context.getRequest().setAttribute("OpportunityList", oppList);
      }

      if (hasPermission(context, "tickets-tickets-view")) {
        TicketList ticketList = new TicketList();
        ticketList.setSearchText(searchCriteria);
        ticketList.buildList(db);
        context.getRequest().setAttribute("TicketList", ticketList);
      }

    } catch (Exception e) {
      errorMessage = e;
    } finally {
      this.freeConnection(context, db);
    }

    if (errorMessage == null) {
      addModuleBean(context, "Search", "Search Results");
      return ("SearchOK");
    } else {
      context.getRequest().setAttribute("Error", errorMessage);
      return ("SystemError");
    }

  }

}


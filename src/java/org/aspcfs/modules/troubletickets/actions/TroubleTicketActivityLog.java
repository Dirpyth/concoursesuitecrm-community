/*
 *  Copyright(c) 2004 Dark Horse Ventures LLC (http://www.centriccrm.com/) All
 *  rights reserved. This material cannot be distributed without written
 *  permission from Dark Horse Ventures LLC. Permission to use, copy, and modify
 *  this material for internal use is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies. DARK HORSE
 *  VENTURES LLC MAKES NO REPRESENTATIONS AND EXTENDS NO WARRANTIES, EXPRESS OR
 *  IMPLIED, WITH RESPECT TO THE SOFTWARE, INCLUDING, BUT NOT LIMITED TO, THE
 *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR ANY PARTICULAR
 *  PURPOSE, AND THE WARRANTY AGAINST INFRINGEMENT OF PATENTS OR OTHER
 *  INTELLECTUAL PROPERTY RIGHTS. THE SOFTWARE IS PROVIDED "AS IS", AND IN NO
 *  EVENT SHALL DARK HORSE VENTURES LLC OR ANY OF ITS AFFILIATES BE LIABLE FOR
 *  ANY DAMAGES, INCLUDING ANY LOST PROFITS OR OTHER INCIDENTAL OR CONSEQUENTIAL
 *  DAMAGES RELATING TO THE SOFTWARE.
 */
package org.aspcfs.modules.troubletickets.actions;

import javax.servlet.*;
import javax.servlet.http.*;
import com.darkhorseventures.framework.actions.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import java.lang.*;
import org.aspcfs.utils.*;
import org.aspcfs.utils.web.*;
import java.sql.Timestamp;
import org.aspcfs.modules.troubletickets.base.*;
import org.aspcfs.modules.accounts.base.Organization;
import org.aspcfs.modules.actions.CFSModule;
import org.aspcfs.modules.base.Constants;
import org.aspcfs.modules.login.beans.UserBean;
import com.zeroio.iteam.base.*;
import com.zeroio.webutils.*;
import java.text.*;
import org.aspcfs.modules.base.*;

/**
 *  Description of the Class
 *
 *@author     kbhoopal
 *@created    March 17, 2004
 *@version    $Id: TroubleTicketActivityLog.java,v 1.6 2004/09/01 15:30:26
 *      mrajkowski Exp $
 */
public final class TroubleTicketActivityLog extends CFSModule {

  /**
   *  Description of the Method
   *
   *@param  context  Description of the Parameter
   *@return          Description of the Return Value
   */
  public String executeCommandList(ActionContext context) {
    if (!hasPermission(context, "tickets-activity-log-view")) {
      return ("PermissionError");
    }
    Connection db = null;
    try {
      String ticketId = context.getRequest().getParameter("id");
      db = this.getConnection(context);
      // Load the ticket
      Ticket thisTicket = new Ticket(db, Integer.parseInt(ticketId));
      context.getRequest().setAttribute("ticketDetails", thisTicket);
      // Build activity list
      TicketActivityLogList thisList = new TicketActivityLogList();
      PagedListInfo tmListInfo = this.getPagedListInfo(context, "TMListInfo");
      tmListInfo.setLink("TroubleTicketActivityLog.do?command=List&id=" + thisTicket.getId());
      thisList.setPagedListInfo(tmListInfo);
      thisList.setTicketId(thisTicket.getId());
      thisList.buildList(db);
      context.getRequest().setAttribute("activityList", thisList);
      return ("ListOK");
    } catch (Exception e) {
      context.getRequest().setAttribute("Error", e);
      return ("SystemError");
    } finally {
      this.freeConnection(context, db);
    }
  }


  /**
   *  Description of the Method
   *
   *@param  context  Description of the Parameter
   *@return          Description of the Return Value
   */
  public String executeCommandAdd(ActionContext context) {
    if (!hasPermission(context, "tickets-activity-log-add")) {
      return ("PermissionError");
    }
    Connection db = null;
    Ticket thisTicket = null;
    try {
      String ticketId = context.getRequest().getParameter("id");
      db = this.getConnection(context);
      // Load the specified ticket
      thisTicket = new Ticket(db, Integer.parseInt(ticketId));
      // Load form elements
      LookupList onsiteModelList = new LookupList(db, "lookup_onsite_model");
      onsiteModelList.addItem(-1, "-- None --");
      context.getRequest().setAttribute("onsiteModelList", onsiteModelList);
      context.getRequest().setAttribute("ticketDetails", thisTicket);
      TicketActivityLog thisMaintenance = (TicketActivityLog) context.getRequest().getAttribute("activityDetails");
      if (thisMaintenance != null) {
        if (thisMaintenance.getEnteredBy() == -1) {
          // Load the activity log elements
          thisMaintenance = new TicketActivityLog();
          context.getRequest().setAttribute("activityDetails", thisMaintenance);
        }
      }
      return ("AddOK");
    } catch (Exception e) {
      context.getRequest().setAttribute("Error", e);
      return ("SystemError");
    } finally {
      this.freeConnection(context, db);
    }
  }


  /**
   *  Description of the Method
   *
   *@param  context  Description of the Parameter
   *@return          Description of the Return Value
   */
  public String executeCommandModify(ActionContext context) {
    if (!hasPermission(context, "tickets-activity-log-edit")) {
      return ("PermissionError");
    }
    Ticket thisTicket = null;
    Connection db = null;
    // Begin with data needed for all forms
    try {
      thisTicket = (Ticket) context.getFormBean();
      if (thisTicket.getId() == -1) {
        String ticketId = context.getRequest().getParameter("id");
        String formId = context.getRequest().getParameter("formId");
        db = this.getConnection(context);

        // Load the ticket
        thisTicket = new Ticket(db, Integer.parseInt(ticketId));
        context.getRequest().setAttribute("ticketDetails", thisTicket);

        // Load onsite model list
        LookupList onsiteModelList = new LookupList(db, "lookup_onsite_model");
        onsiteModelList.addItem(-1, "-- None --");
        context.getRequest().setAttribute("onsiteModelList", onsiteModelList);
        context.getRequest().setAttribute("return", context.getRequest().getParameter("return"));

        // Load the activity log elements
        TicketActivityLog thisMaintenance = new TicketActivityLog();
        thisMaintenance.queryRecord(db, Integer.parseInt(formId));
        context.getRequest().setAttribute("activityDetails", thisMaintenance);
      }
      return ("ModifyOK");
    } catch (Exception e) {
      context.getRequest().setAttribute("Error", e);
      return ("SystemError");
    } finally {
      this.freeConnection(context, db);
    }
  }


  /**
   *  Description of the Method
   *
   *@param  context  Description of the Parameter
   *@return          Description of the Return Value
   */
  public String executeCommandSave(ActionContext context) {
    if (!hasPermission(context, "tickets-activity-log-add")) {
      return ("PermissionError");
    }
    Connection db = null;
    boolean inserted = false;
    try {
      String ticketId = context.getRequest().getParameter("id");
      db = this.getConnection(context);
      // Load the ticket
      Ticket thisTicket = new Ticket(db, Integer.parseInt(ticketId));
      // Save the base data
      TicketActivityLog thisMaintenance = new TicketActivityLog();
      thisMaintenance.setModifiedBy(getUserId(context));
      thisMaintenance.setEnteredBy(getUserId(context));
      thisMaintenance.setLinkTicketId(thisTicket.getId());
      thisMaintenance.setTravelTowardsServiceContract((String) context.getRequest().getParameter("travelTowardsServiceContract"));
      thisMaintenance.setLaborTowardsServiceContract((String) context.getRequest().getParameter("laborTowardsServiceContract"));
      thisMaintenance.setPhoneResponseTime((String) context.getRequest().getParameter("phoneResponseTime"));
      thisMaintenance.setEngineerResponseTime((String) context.getRequest().getParameter("engineerResponseTime"));
      thisMaintenance.setAlertDateTimeZone((String) context.getRequest().getParameter("alertDateTimeZone"));
      thisMaintenance.setTimeZoneForDateFields(context.getRequest(), context.getRequest().getParameter("alertDate"), "alertDate");
      thisMaintenance.setFollowUpRequired((String) context.getRequest().getParameter("followUpRequired"));
      thisMaintenance.setFollowUpDescription((String) context.getRequest().getParameter("followUpDescription"));
      thisMaintenance.setOnlyWarnings(context.getRequest().getParameter("onlyWarnings"));
      thisMaintenance.setRequestItems(context.getRequest());
      thisMaintenance.setRequest(context.getRequest());
      thisMaintenance.setRelatedContractId(thisTicket.getContractId());
      inserted = thisMaintenance.insert(db);
      if (!inserted) {
        context.getRequest().setAttribute("ticketDetails", thisTicket);
        context.getRequest().setAttribute("activityDetails", thisMaintenance);
        processErrors(context, thisMaintenance.getErrors());
        processWarnings(context, thisMaintenance.getWarnings());
      }
    } catch (Exception e) {
      context.getRequest().setAttribute("Error", e);
      return ("SystemError");
    } finally {
      this.freeConnection(context, db);
    }
    if (!inserted) {
      return executeCommandAdd(context);
    } else {
      return executeCommandList(context);
    }
  }


  /**
   *  Description of the Method
   *
   *@param  context  Description of the Parameter
   *@return          Description of the Return Value
   */
  public String executeCommandUpdate(ActionContext context) {
    if (!hasPermission(context, "tickets-activity-log-edit")) {
      return ("PermissionError");
    }
    Connection db = null;
    int resultCount = -1;
    try {
      String ticketId = context.getRequest().getParameter("id");
      String formId = context.getRequest().getParameter("formId");
      db = this.getConnection(context);
      // Load the ticket
      Ticket thisTicket = new Ticket(db, Integer.parseInt(ticketId));
      // Save the base data
      TicketActivityLog thisMaintenance = new TicketActivityLog();
      thisMaintenance.setId(Integer.parseInt(formId));
      thisMaintenance.setModifiedBy(getUserId(context));
      thisMaintenance.setLinkTicketId(thisTicket.getId());
      thisMaintenance.setTravelTowardsServiceContract((String) context.getRequest().getParameter("travelTowardsServiceContract"));
      thisMaintenance.setLaborTowardsServiceContract((String) context.getRequest().getParameter("laborTowardsServiceContract"));
      thisMaintenance.setPhoneResponseTime((String) context.getRequest().getParameter("phoneResponseTime"));
      thisMaintenance.setEngineerResponseTime((String) context.getRequest().getParameter("engineerResponseTime"));
      thisMaintenance.setAlertDateTimeZone((String) context.getRequest().getParameter("alertDateTimeZone"));
      thisMaintenance.setTimeZoneForDateFields(context.getRequest(), context.getRequest().getParameter("alertDate"), "alertDate");
      thisMaintenance.setFollowUpRequired((String) context.getRequest().getParameter("followUpRequired"));
      thisMaintenance.setFollowUpDescription((String) context.getRequest().getParameter("followUpDescription"));
      thisMaintenance.setOnlyWarnings(context.getRequest().getParameter("onlyWarnings"));
      thisMaintenance.setRequestItems(context.getRequest());
      String modified = context.getRequest().getParameter("modified");
      thisMaintenance.setModified(modified);
      thisMaintenance.setRequest(context.getRequest());
      thisMaintenance.setRelatedContractId(thisTicket.getContractId());
      resultCount = thisMaintenance.update(db);
      if (resultCount == -1) {
        context.getRequest().setAttribute("ticketDetails", thisTicket);
        context.getRequest().setAttribute("activityDetails", thisMaintenance);
        processErrors(context, thisMaintenance.getErrors());
        processWarnings(context, thisMaintenance.getWarnings());
      }
    } catch (Exception e) {
      context.getRequest().setAttribute("Error", e);
      return ("SystemError");
    } finally {
      this.freeConnection(context, db);
    }
    if (resultCount == -1) {
      return (executeCommandModify(context));
    } else if (resultCount == 1) {
      if ("list".equals(context.getRequest().getParameter("return"))) {
        return executeCommandList(context);
      } else {
        return executeCommandView(context);
      }
    } else {
      context.getRequest().setAttribute("Error", NOT_UPDATED_MESSAGE);
      return ("UserError");
    }
  }


  /**
   *  Description of the Method
   *
   *@param  context  Description of the Parameter
   *@return          Description of the Return Value
   */
  public String executeCommandView(ActionContext context) {
    if (!hasPermission(context, "tickets-activity-log-view")) {
      return ("PermissionError");
    }
    Connection db = null;
    try {
      String ticketId = context.getRequest().getParameter("id");
      String formId = context.getRequest().getParameter("formId");
      db = this.getConnection(context);
      // Load the ticket
      Ticket thisTicket = new Ticket(db, Integer.parseInt(ticketId));
      context.getRequest().setAttribute("ticketDetails", thisTicket);

      // Load the onsiteModelList
      LookupList onsiteModelList = new LookupList(db, "lookup_onsite_model");
      onsiteModelList.addItem(-1, "-- None --");
      context.getRequest().setAttribute("onsiteModelList", onsiteModelList);

      // Activity Log items
      TicketActivityLog thisMaintenance = new TicketActivityLog();
      thisMaintenance.queryRecord(db, Integer.parseInt(formId));
      context.getRequest().setAttribute("activityDetails", thisMaintenance);
      return ("ViewOK");
    } catch (Exception e) {
      context.getRequest().setAttribute("Error", e);
      return ("SystemError");
    } finally {
      this.freeConnection(context, db);
    }
  }



  /**
   *  Description of the Method
   *
   *@param  context  Description of the Parameter
   *@return          Description of the Return Value
   */
  public String executeCommandConfirmDelete(ActionContext context) {
    if (!hasPermission(context, "tickets-activity-log-delete")) {
      return ("PermissionError");
    }
    Connection db = null;
    HtmlDialog htmlDialog = new HtmlDialog();
    try {
      // Process form data
      String ticketId = context.getRequest().getParameter("id");
      String formId = context.getRequest().getParameter("formId");
      // Load the ticket
      db = this.getConnection(context);
      Ticket thisTicket = new Ticket();
      thisTicket.queryRecord(db, Integer.parseInt(ticketId));
      context.getRequest().setAttribute("ticketDetails", thisTicket);
      // Prepare the HTML Dialog
      htmlDialog.setTitle("Dark Horse CRM: Confirm Delete");
      TicketActivityLog thisMaintenance = new TicketActivityLog();
      thisMaintenance.queryRecord(db, Integer.parseInt(formId));
      DependencyList dependencies = new DependencyList();
      dependencies = thisMaintenance.processDependencies();
      htmlDialog.addMessage(dependencies.getHtmlString());
      htmlDialog.setHeader("The form you are requesting to delete may have dependencies within Dark Horse CRM:");
      htmlDialog.addButton("Delete", "javascript:window.location.href='TroubleTicketActivityLog.do?command=Delete&id=" + ticketId + "&formId=" + formId + "'");
      htmlDialog.addButton("Cancel", "javascript:parent.window.close()");
    } catch (Exception e) {
      context.getRequest().setAttribute("Error", e);
      return ("SystemError");
    } finally {
      this.freeConnection(context, db);
    }
    context.getSession().setAttribute("Dialog", htmlDialog);
    return ("ConfirmDeleteOK");
  }


  /**
   *  Description of the Method
   *
   *@param  context  Description of the Parameter
   *@return          Description of the Return Value
   */
  public String executeCommandDelete(ActionContext context) {
    if (!hasPermission(context, "tickets-activity-log-delete")) {
      return ("PermissionError");
    }
    boolean recordDeleted = false;
    Ticket thisTicket = null;
    Connection db = null;
    // Process the parameters
    String ticketId = context.getRequest().getParameter("id");
    int formId = Integer.parseInt((String) context.getRequest().getParameter("formId"));
    try {
      db = this.getConnection(context);
      thisTicket = new Ticket(db, Integer.parseInt(ticketId));
      context.getRequest().setAttribute("ticketDetails", thisTicket);
      TicketActivityLog thisMaintenance = new TicketActivityLog();
      thisMaintenance.queryRecord(db, formId);
      thisMaintenance.setRequest(context.getRequest());
      thisMaintenance.setRelatedContractId(thisTicket.getContractId());
      recordDeleted = thisMaintenance.delete(db);
    } catch (Exception e) {
      context.getRequest().setAttribute("actionError", "The note could not be deleted because of referential integrity .");
      context.getRequest().setAttribute("refreshUrl", "TroubleTicketActivityLog.do?command=View&id=" + ticketId);
      return ("DeleteError");
    } finally {
      this.freeConnection(context, db);
    }
    // The record was deleted
    if (recordDeleted) {
      context.getRequest().setAttribute("refreshUrl", "TroubleTicketActivityLog.do?command=List&id=" + ticketId);
      return this.getReturn(context, "Delete");
    }
    // An error occurred, so notify the user
    processErrors(context, thisTicket.getErrors());
    context.getRequest().setAttribute("refreshUrl", "TroubleTicketActivityLog.do?command=View&id=" + ticketId + "&formId=" + formId);
    return this.getReturn(context, "Delete");
  }
}


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
package org.aspcfs.modules.contacts.base;

import java.util.*;
import java.sql.*;
import java.text.DateFormat;
import org.aspcfs.utils.web.PagedListInfo;
import org.aspcfs.utils.DatabaseUtils;
import org.aspcfs.modules.base.Constants;
import org.aspcfs.utils.DateUtils;

/**
 *  Description of the Class
 *
 *@author     chris
 *@created    January 8, 2002
 *@version    $Id$
 */
public class CallList extends ArrayList {

  public final static String tableName = "call_log";
  public final static String uniqueField = "call_id";
  protected java.sql.Timestamp lastAnchor = null;
  protected java.sql.Timestamp nextAnchor = null;
  protected int syncType = Constants.NO_SYNC;

  protected PagedListInfo pagedListInfo = null;
  protected int contactId = -1;
  protected int orgId = -1;
  protected int oppHeaderId = -1;
  protected int enteredBy = -1;
  protected int owner = -1;
  protected boolean hasAlertDate = false;
  protected java.sql.Timestamp alertDate = null;
  protected java.sql.Timestamp alertRangeStart = null;
  protected java.sql.Timestamp alertRangeEnd = null;
  protected java.sql.Timestamp notificationRangeStart = null;
  protected java.sql.Timestamp notificationRangeEnd = null;
  protected boolean onlyPending = false;
  protected boolean excludeCanceled = false;
  protected boolean onlyCompleted = false;
  protected boolean allContactsInAccount = false;
  protected int contactOrgId = -1;


  /**
   *  Constructor for the CallList object
   *
   *@since
   */
  public CallList() { }


  /**
   *  Sets the PagedListInfo attribute of the CallList object
   *
   *@param  tmp  The new PagedListInfo value
   *@since
   */
  public void setPagedListInfo(PagedListInfo tmp) {
    this.pagedListInfo = tmp;
  }


  /**
   *  Sets the ContactId attribute of the CallList object
   *
   *@param  tmp  The new ContactId value
   *@since
   */
  public void setContactId(int tmp) {
    this.contactId = tmp;
  }


  /**
   *  Sets the ContactId attribute of the CallList object
   *
   *@param  tmp  The new ContactId value
   *@since
   */
  public void setContactId(String tmp) {
    this.contactId = Integer.parseInt(tmp);
  }


  /**
   *  Sets the OrgId attribute of the CallList object
   *
   *@param  tmp  The new OrgId value
   *@since
   */
  public void setOrgId(int tmp) {
    this.orgId = tmp;
  }


  /**
   *  Sets the oppHeaderId attribute of the CallList object
   *
   *@param  oppHeaderId  The new oppHeaderId value
   */
  public void setOppHeaderId(int oppHeaderId) {
    this.oppHeaderId = oppHeaderId;
  }


  /**
   *  Sets the EnteredBy attribute of the CallList object
   *
   *@param  tmp  The new EnteredBy value
   *@since
   */
  public void setEnteredBy(int tmp) {
    this.enteredBy = tmp;
  }


  /**
   *  Sets the AlertDate attribute of the CallList object
   *
   *@param  alertDate  The new AlertDate value
   *@since
   */
  public void setAlertDate(java.sql.Timestamp alertDate) {
    this.alertDate = alertDate;
  }


  /**
   *  Sets the HasAlertDate attribute of the CallList object
   *
   *@param  tmp  The new HasAlertDate value
   *@since
   */
  public void setHasAlertDate(boolean tmp) {
    this.hasAlertDate = tmp;
  }


  /**
   *  Sets the oppHeaderId attribute of the CallList object
   *
   *@param  oppHeaderId  The new oppHeaderId value
   */
  public void setOppHeaderId(String oppHeaderId) {
    this.oppHeaderId = Integer.parseInt(oppHeaderId);
  }


  /**
   *  Sets the alertRangeStart attribute of the Task object
   *
   *@param  alertRangeStart  The new alertRangeStart value
   */
  public void setAlertRangeStart(java.sql.Timestamp alertRangeStart) {
    this.alertRangeStart = alertRangeStart;
  }


  /**
   *  Sets the alertRangeStart attribute of the CallList object
   *
   *@param  tmp  The new alertRangeStart value
   */
  public void setAlertRangeStart(String tmp) {
    this.alertRangeStart = java.sql.Timestamp.valueOf(tmp);
  }


  /**
   *  Sets the owner attribute of the CallList object
   *
   *@param  owner  The new owner value
   */
  public void setOwner(int owner) {
    this.owner = owner;
  }


  /**
   *  Gets the owner attribute of the CallList object
   *
   *@return    The owner value
   */
  public int getOwner() {
    return owner;
  }


  /**
   *  Sets the alertRangeStart attribute of the CallList object
   *
   *@param  tmp  The new alertRangeStart value
   */

  /**
   *  Sets the alertRangeEnd attribute of the CallList object
   *
   *@param  tmp  The new alertRangeEnd value
   */
  public void setAlertRangeEnd(java.sql.Timestamp tmp) {
    this.alertRangeEnd = tmp;
  }


  /**
   *  Sets the alertRangeEnd attribute of the CallList object
   *
   *@param  tmp  The new alertRangeEnd value
   */
  public void setAlertRangeEnd(String tmp) {
    this.alertRangeEnd = java.sql.Timestamp.valueOf(tmp);
  }


  /**
   *  Sets the onlyPending attribute of the CallList object
   *
   *@param  tmp  The new onlyPending value
   */
  public void setOnlyPending(boolean tmp) {
    this.onlyPending = tmp;
  }


  /**
   *  Sets the onlyPending attribute of the CallList object
   *
   *@param  tmp  The new onlyPending value
   */
  public void setOnlyPending(String tmp) {
    this.onlyPending = DatabaseUtils.parseBoolean(tmp);
  }


  /**
   *  Sets the excludeCanceled attribute of the CallList object
   *
   *@param  excludeCanceled  The new excludeCanceled value
   */
  public void setExcludeCanceled(boolean excludeCanceled) {
    this.excludeCanceled = excludeCanceled;
  }


  /**
   *  Sets the onlyCompleted attribute of the CallList object
   *
   *@param  onlyCompleted  The new onlyCompleted value
   */
  public void setOnlyCompleted(boolean onlyCompleted) {
    this.onlyCompleted = onlyCompleted;
  }


  /**
   *  Sets the notificationRangeStart attribute of the CallList object
   *
   *@param  notificationRangeStart  The new notificationRangeStart value
   */
  public void setNotificationRangeStart(java.sql.Timestamp notificationRangeStart) {
    this.notificationRangeStart = notificationRangeStart;
  }


  /**
   *  Sets the notificationRangeEnd attribute of the CallList object
   *
   *@param  notificationRangeEnd  The new notificationRangeEnd value
   */
  public void setNotificationRangeEnd(java.sql.Timestamp notificationRangeEnd) {
    this.notificationRangeEnd = notificationRangeEnd;
  }


  /**
   *  Sets the allContactsInAccount attribute of the CallList object
   *
   *@param  allContactsInAccount  The new allContactsInAccount value
   *@param  contactOrgId          The new allContactsInAccount value
   */
  public void setAllContactsInAccount(boolean allContactsInAccount, int contactOrgId) {
    this.allContactsInAccount = allContactsInAccount;
    this.contactOrgId = contactOrgId;
  }


  /**
   *  Gets the allContactsInAccount attribute of the CallList object
   *
   *@return    The allContactsInAccount value
   */
  public boolean getAllContactsInAccount() {
    return allContactsInAccount;
  }


  /**
   *  Gets the contactOrgId attribute of the CallList object
   *
   *@return    The contactOrgId value
   */
  public int getContactOrgId() {
    return contactOrgId;
  }


  /**
   *  Gets the notificationRangeStart attribute of the CallList object
   *
   *@return    The notificationRangeStart value
   */
  public java.sql.Timestamp getNotificationRangeStart() {
    return notificationRangeStart;
  }


  /**
   *  Gets the notificationRangeEnd attribute of the CallList object
   *
   *@return    The notificationRangeEnd value
   */
  public java.sql.Timestamp getNotificationRangeEnd() {
    return notificationRangeEnd;
  }


  /**
   *  Gets the onlyCompleted attribute of the CallList object
   *
   *@return    The onlyCompleted value
   */
  public boolean getOnlyCompleted() {
    return onlyCompleted;
  }


  /**
   *  Gets the excludeCanceled attribute of the CallList object
   *
   *@return    The excludeCanceled value
   */
  public boolean getExcludeCanceled() {
    return excludeCanceled;
  }


  /**
   *  Gets the alertRangeStart attribute of the CallList object
   *
   *@return    The alertRangeStart value
   */
  public java.sql.Timestamp getAlertRangeStart() {
    return alertRangeStart;
  }


  /**
   *  Gets the alertRangeEnd attribute of the CallList object
   *
   *@return    The alertRangeEnd value
   */
  public java.sql.Timestamp getAlertRangeEnd() {
    return alertRangeEnd;
  }


  /**
   *  Gets the AlertDate attribute of the CallList object
   *
   *@return    The AlertDate value
   *@since
   */
  public java.sql.Timestamp getAlertDate() {
    return alertDate;
  }


  /**
   *  Gets the EnteredBy attribute of the CallList object
   *
   *@return    The EnteredBy value
   *@since
   */
  public int getEnteredBy() {
    return enteredBy;
  }


  /**
   *  Gets the HasAlertDate attribute of the CallList object
   *
   *@return    The HasAlertDate value
   *@since
   */
  public boolean getHasAlertDate() {
    return hasAlertDate;
  }


  /**
   *  Gets the tableName attribute of the CallList object
   *
   *@return    The tableName value
   */
  public String getTableName() {
    return tableName;
  }


  /**
   *  Gets the uniqueField attribute of the CallList object
   *
   *@return    The uniqueField value
   */
  public String getUniqueField() {
    return uniqueField;
  }


  /**
   *  Gets the lastAnchor attribute of the CallList object
   *
   *@return    The lastAnchor value
   */
  public java.sql.Timestamp getLastAnchor() {
    return lastAnchor;
  }


  /**
   *  Gets the nextAnchor attribute of the CallList object
   *
   *@return    The nextAnchor value
   */
  public java.sql.Timestamp getNextAnchor() {
    return nextAnchor;
  }


  /**
   *  Gets the syncType attribute of the CallList object
   *
   *@return    The syncType value
   */
  public int getSyncType() {
    return syncType;
  }


  /**
   *  Sets the lastAnchor attribute of the CallList object
   *
   *@param  tmp  The new lastAnchor value
   */
  public void setLastAnchor(java.sql.Timestamp tmp) {
    this.lastAnchor = tmp;
  }


  /**
   *  Sets the nextAnchor attribute of the CallList object
   *
   *@param  tmp  The new nextAnchor value
   */
  public void setNextAnchor(java.sql.Timestamp tmp) {
    this.nextAnchor = tmp;
  }


  /**
   *  Sets the syncType attribute of the CallList object
   *
   *@param  tmp  The new syncType value
   */
  public void setSyncType(int tmp) {
    this.syncType = tmp;
  }


  /**
   *  Gets the PagedListInfo attribute of the CallList object
   *
   *@return    The PagedListInfo value
   *@since
   */
  public PagedListInfo getPagedListInfo() {
    return pagedListInfo;
  }


  /**
   *  Gets the ContactId attribute of the CallList object
   *
   *@return    The ContactId value
   *@since
   */
  public int getContactId() {
    return contactId;
  }


  /**
   *  Gets the OrgId attribute of the CallList object
   *
   *@return    The OrgId value
   *@since
   */
  public int getOrgId() {
    return orgId;
  }


  /**
   *  Gets the oppHeaderId attribute of the CallList object
   *
   *@return    The oppHeaderId value
   */
  public int getOppHeaderId() {
    return oppHeaderId;
  }


  /**
   *  Gets the onlyPending attribute of the CallList object
   *
   *@return    The onlyPending value
   */
  public boolean getOnlyPending() {
    return onlyPending;
  }


  /**
   *  Description of the Method
   *
   *@param  db                Description of the Parameter
   *@param  timeZone          Description of the Parameter
   *@return                   Description of the Return Value
   *@exception  SQLException  Description of the Exception
   */
  public HashMap queryRecordCount(Connection db, TimeZone timeZone) throws SQLException {

    PreparedStatement pst = null;
    ResultSet rs = null;

    HashMap events = new HashMap();
    StringBuffer sqlSelect = new StringBuffer();
    StringBuffer sqlFilter = new StringBuffer();
    StringBuffer sqlTail = new StringBuffer();

    String sqlDate = (onlyPending ? "alertdate" : "entered");

    createFilter(sqlFilter);

    sqlSelect.append(
        "SELECT " + sqlDate + " as date " +
        "FROM call_log c " +
        "WHERE call_id > -1 ");
    pst = db.prepareStatement(sqlSelect.toString() + sqlFilter.toString() + sqlTail.toString());
    prepareFilter(pst);
    rs = pst.executeQuery();
    while (rs.next()) {
      String alertDate = DateUtils.getServerToUserDateString(timeZone, DateFormat.SHORT, rs.getTimestamp("date"));
      if (events.containsKey(alertDate)) {
        Integer count = (Integer) events.get(alertDate);
        int tmpCount = count.intValue();
        events.put(alertDate, new Integer(++tmpCount));
      } else {
        events.put(alertDate, new Integer(1));
      }
    }
    rs.close();
    pst.close();
    return events;
  }


  /**
   *  Description of the Method
   *
   *@param  db                Description of the Parameter
   *@exception  SQLException  Description of the Exception
   */
  public void buildShortList(Connection db) throws SQLException {
    PreparedStatement pst = null;
    ResultSet rs = null;
    StringBuffer sqlSelect = new StringBuffer();
    StringBuffer sqlFilter = new StringBuffer();
    StringBuffer sqlOrder = new StringBuffer();
    createFilter(sqlFilter);
    sqlSelect.append(
        "SELECT c.call_id, c.subject, c.contact_id, c.opp_id, c.opp_id, c.alertdate, c.alert, " +
        "c.owner, c.complete_date, ct.org_id as contact_org_id, ct.namelast as ctlast, ct.namefirst as ctfirst, " + "ct.company as ctcompany, ct.org_name as orgname, c.status_id, c.entered, p.description as priority " +
        "FROM call_log c " +
        "LEFT JOIN lookup_call_priority p ON (c.priority_id = p.code) " +
        "LEFT JOIN contact ct ON (c.contact_id = ct.contact_id) " +
        "WHERE c.call_id > -1 ");
    if (onlyCompleted) {
      sqlOrder.append("ORDER BY c.entered ");
    } else {
      sqlOrder.append("ORDER BY c.alertdate, p.weight DESC ");
    }
    pst = db.prepareStatement(sqlSelect.toString() + sqlFilter.toString() + sqlOrder.toString());
    prepareFilter(pst);
    rs = pst.executeQuery();
    while (rs.next()) {
      Call thisCall = new Call();
      thisCall.setId(rs.getInt("call_id"));
      thisCall.setSubject(rs.getString("subject"));
      thisCall.setContactId(DatabaseUtils.getInt(rs, "contact_id"));
      thisCall.setOppHeaderId(DatabaseUtils.getInt(rs, "opp_id"));

      thisCall.setAlertDate(rs.getTimestamp("alertdate"));
      thisCall.setAlertText(rs.getString("alert"));
      thisCall.setOwner(rs.getInt("owner"));
      thisCall.setCompleteDate(rs.getTimestamp("complete_date"));
      //contact details
      thisCall.setContactOrgId(DatabaseUtils.getInt(rs, "contact_org_id"));
      String contactName = Contact.getNameLastFirst(rs.getString("ctlast"), rs.getString("ctfirst"));
      if (contactName == null || "".equals(contactName)) {
        contactName = rs.getString("ctcompany");
      }
      thisCall.setOrgName(rs.getString("orgname"));
      thisCall.setContactName(contactName);
      thisCall.setStatusId(rs.getInt("status_id"));
      thisCall.setEntered(rs.getTimestamp("entered"));
      thisCall.setPriorityString(rs.getString("priority"));

      //build Contact Details
      Contact thisContact = new Contact();
      thisContact.setId(thisCall.getContactId());
      thisContact.buildPhoneNumberList(db);
      thisCall.setContact(thisContact);

      //add call to list
      this.add(thisCall);
    }
    rs.close();
    pst.close();
  }


  /**
   *  Description of the Method
   *
   *@param  db                Description of Parameter
   *@exception  SQLException  Description of Exception
   *@since
   */
  public void buildList(Connection db) throws SQLException {
    PreparedStatement pst = null;
    ResultSet rs = null;
    int items = -1;
    StringBuffer sqlSelect = new StringBuffer();
    StringBuffer sqlCount = new StringBuffer();
    StringBuffer sqlFilter = new StringBuffer();
    StringBuffer sqlOrder = new StringBuffer();
    //Need to build a base SQL statement for counting records
    sqlCount.append(
        "SELECT COUNT(*) as recordcount " +
        "FROM call_log c " +
        "WHERE call_id > -1 ");
    createFilter(sqlFilter);
    if (pagedListInfo != null) {
      //Get the total number of records matching filter
      pst = db.prepareStatement(sqlCount.toString() + sqlFilter.toString());
      items = prepareFilter(pst);
      rs = pst.executeQuery();
      if (rs.next()) {
        int maxRecords = rs.getInt("recordcount");
        pagedListInfo.setMaxRecords(maxRecords);
      }
      rs.close();
      pst.close();
      //Determine column to sort by
      pagedListInfo.setDefaultSort("c.entered", "desc");
      pagedListInfo.appendSqlTail(db, sqlOrder);
    } else {
      sqlOrder.append("ORDER BY c.entered DESC ");
    }

    //Need to build a base SQL statement for returning records
    if (pagedListInfo != null) {
      pagedListInfo.appendSqlSelectHead(db, sqlSelect);
    } else {
      sqlSelect.append("SELECT ");
    }
    sqlSelect.append(
        "c.call_id, c.org_id, c.contact_id, c.opp_id, c.call_type_id, c.length, " +
        "c.subject, c.notes, c.entered, c.enteredby, c.modified, c.modifiedby, c.alertdate, " +
        "c.followup_date, c.parent_id, c.owner, c.assignedby, c.assign_date, c.completedby, " +
        "c.complete_date, c.result_id, c.priority_id, c.status_id, c.reminder_value, c.reminder_type_id, " +
        "c.alert_call_type_id, c.alert, c.followup_notes, c.alertdate_timezone, t.*, talert.description as alertType, " +
        "ct.namelast as ctlast, ct.namefirst as ctfirst, ct.company as ctcompany, p.description as priority " +
        "FROM call_log c " +
        "LEFT JOIN contact ct ON (c.contact_id = ct.contact_id) " +
        "LEFT JOIN lookup_call_types t ON (c.call_type_id = t.code) " +
        "LEFT JOIN lookup_call_types talert ON (c.alert_call_type_id = talert.code) " +
        "LEFT JOIN lookup_call_priority p ON (c.priority_id = p.code) " +
        "WHERE call_id > -1 ");
    pst = db.prepareStatement(sqlSelect.toString() + sqlFilter.toString() + sqlOrder.toString());
    items = prepareFilter(pst);
    rs = pst.executeQuery();
    if (pagedListInfo != null) {
      pagedListInfo.doManualOffset(db, rs);
    }
    int count = 0;
    while (rs.next()) {
      if (pagedListInfo != null && pagedListInfo.getItemsPerPage() > 0 &&
          DatabaseUtils.getType(db) == DatabaseUtils.MSSQL &&
          count >= pagedListInfo.getItemsPerPage()) {
        break;
      }
      ++count;
      Call thisCall = new Call(rs);
      this.add(thisCall);
    }
    rs.close();
    pst.close();
  }


  /**
   *  Description of the Method
   *
   *@param  db                Description of Parameter
   *@exception  SQLException  Description of Exception
   */
  public void delete(Connection db) throws SQLException {
    Iterator calls = this.iterator();
    while (calls.hasNext()) {
      Call thisCall = (Call) calls.next();
      thisCall.delete(db);
    }
  }


  /**
   *  Description of the Method
   *
   *@param  sqlFilter  Description of Parameter
   *@since
   */
  protected void createFilter(StringBuffer sqlFilter) {
    if (sqlFilter == null) {
      sqlFilter = new StringBuffer();
    }
    if (contactId != -1) {
      sqlFilter.append("AND c.contact_id = ? ");
    }

    if (allContactsInAccount) {
      sqlFilter.append("AND c.org_id = ? ");
    }

    if (hasAlertDate == true) {
      sqlFilter.append("AND c.alertdate IS NOT NULL ");
    }
    if (oppHeaderId != -1) {
      sqlFilter.append("AND c.opp_id = ? ");
    }
    if (enteredBy != -1) {
      sqlFilter.append("AND c.enteredby = ? ");
    }
    if (alertDate != null) {
      sqlFilter.append("AND c.alertdate = ? ");
    }
    if (orgId != -1) {
      sqlFilter.append("AND c.org_id = ? ");
    }

    if (owner != -1) {
      sqlFilter.append("AND c.owner = ? ");
    }

    if (alertRangeStart != null) {
      if (onlyCompleted) {
        sqlFilter.append("AND c.entered >= ? ");
      } else {
        sqlFilter.append("AND c.alertdate >= ? ");
      }
    }

    if (alertRangeEnd != null) {
      if (onlyCompleted) {
        sqlFilter.append("AND c.entered < ? ");
      } else {
        sqlFilter.append("AND c.alertdate < ? ");
      }
    }

    if (notificationRangeStart != null) {
      sqlFilter.append("AND c.followup_date >= ? ");
    }

    if (notificationRangeEnd != null) {
      sqlFilter.append("AND c.followup_date < ? ");
    }

    if (onlyPending) {
      sqlFilter.append("AND c.status_id = ? AND alertdate is NOT NULL ");
    }

    if (onlyCompleted) {
      sqlFilter.append("AND (c.status_id = ? OR c.status_id = ?) ");
    }

    if (excludeCanceled) {
      sqlFilter.append("AND c.status_id != ? ");
    }
  }


  /**
   *  Description of the Method
   *
   *@param  pst               Description of Parameter
   *@return                   Description of the Returned Value
   *@exception  SQLException  Description of Exception
   *@since
   */
  protected int prepareFilter(PreparedStatement pst) throws SQLException {
    int i = 0;
    if (contactId != -1) {
      pst.setInt(++i, contactId);
    }

    if (allContactsInAccount) {
      pst.setInt(++i, contactOrgId);
    }

    if (oppHeaderId != -1) {
      pst.setInt(++i, oppHeaderId);
    }
    if (enteredBy != -1) {
      pst.setInt(++i, enteredBy);
    }
    if (alertDate != null) {
      pst.setTimestamp(++i, alertDate);
    }
    if (orgId != -1) {
      pst.setInt(++i, orgId);
    }
    if (owner != -1) {
      pst.setInt(++i, owner);
    }
    if (alertRangeStart != null) {
      pst.setTimestamp(++i, alertRangeStart);
    }
    if (alertRangeEnd != null) {
      pst.setTimestamp(++i, alertRangeEnd);
    }
    if (notificationRangeStart != null) {
      pst.setTimestamp(++i, notificationRangeStart);
    }
    if (notificationRangeEnd != null) {
      pst.setTimestamp(++i, notificationRangeEnd);
    }
    if (onlyPending) {
      pst.setInt(++i, Call.COMPLETE_FOLLOWUP_PENDING);
    }
    if (onlyCompleted) {
      pst.setInt(++i, Call.COMPLETE_FOLLOWUP_PENDING);
      pst.setInt(++i, Call.COMPLETE);
    }
    if (excludeCanceled) {
      pst.setInt(++i, Call.CANCELED);
    }
    return i;
  }
}



//Copyright 2002 Dark Horse Ventures

package org.aspcfs.modules.admin.base;

import java.util.Vector;
import java.util.Iterator;
import java.sql.*;
import javax.servlet.http.*;
import com.darkhorseventures.database.Connection;
import org.aspcfs.modules.utils.web.*;
import org.aspcfs.modules.utils.DatabaseUtils;
import org.aspcfs.modules.modules.admin.base.PermissionCategory;


/**
 *  Description of the Class
 *
 *@author     Mathur
 *@created    January 13, 2003
 *@version    $Id$
 */
public class PermissionCategoryList extends Vector {

  private PagedListInfo pagedListInfo = null;

  public final static String tableName = "permission_category";
  public final static String uniqueField = "category_id";
  private java.sql.Timestamp lastAnchor = null;
  private java.sql.Timestamp nextAnchor = null;
  private int syncType = Constants.NO_SYNC;
  private boolean customizableModulesOnly = false;

  private int enabledState = -1;
  private int activeState = -1;


  /**
   *  Constructor for the PermissionCategoryList object
   */
  public PermissionCategoryList() { }


  /**
   *  Sets the pagedListInfo attribute of the PermissionCategoryList object
   *
   *@param  tmp  The new pagedListInfo value
   */
  public void setPagedListInfo(PagedListInfo tmp) {
    this.pagedListInfo = tmp;
  }


  /**
   *  Gets the pagedListInfo attribute of the PermissionCategoryList object
   *
   *@return    The pagedListInfo value
   */
  public PagedListInfo getPagedListInfo() {
    return pagedListInfo;
  }


  /**
   *  Gets the tableName attribute of the PermissionCategoryList object
   *
   *@return    The tableName value
   */
  public String getTableName() {
    return tableName;
  }


  /**
   *  Gets the uniqueField attribute of the PermissionCategoryList object
   *
   *@return    The uniqueField value
   */
  public String getUniqueField() {
    return uniqueField;
  }


  /**
   *  Gets the lastAnchor attribute of the PermissionCategoryList object
   *
   *@return    The lastAnchor value
   */
  public java.sql.Timestamp getLastAnchor() {
    return lastAnchor;
  }


  /**
   *  Gets the nextAnchor attribute of the PermissionCategoryList object
   *
   *@return    The nextAnchor value
   */
  public java.sql.Timestamp getNextAnchor() {
    return nextAnchor;
  }


  /**
   *  Gets the syncType attribute of the PermissionCategoryList object
   *
   *@return    The syncType value
   */
  public int getSyncType() {
    return syncType;
  }


  /**
   *  Sets the lastAnchor attribute of the PermissionCategoryList object
   *
   *@param  tmp  The new lastAnchor value
   */
  public void setLastAnchor(java.sql.Timestamp tmp) {
    this.lastAnchor = tmp;
  }


  /**
   *  Sets the nextAnchor attribute of the PermissionCategoryList object
   *
   *@param  tmp  The new nextAnchor value
   */
  public void setNextAnchor(java.sql.Timestamp tmp) {
    this.nextAnchor = tmp;
  }


  /**
   *  Sets the syncType attribute of the PermissionCategoryList object
   *
   *@param  tmp  The new syncType value
   */
  public void setSyncType(int tmp) {
    this.syncType = tmp;
  }


  /**
   *  Sets the enabledState attribute of the PermissionCategoryList object
   *
   *@param  tmp  The new enabledState value
   */
  public void setEnabledState(int tmp) {
    this.enabledState = tmp;
  }


  /**
   *  Sets the activeState attribute of the PermissionCategoryList object
   *
   *@param  tmp  The new activeState value
   */
  public void setActiveState(int tmp) {
    this.activeState = tmp;
  }


  /**
   *  Gets the enabledState attribute of the PermissionCategoryList object
   *
   *@return    The enabledState value
   */
  public int getEnabledState() {
    return enabledState;
  }


  /**
   *  Gets the activeState attribute of the PermissionCategoryList object
   *
   *@return    The activeState value
   */
  public int getActiveState() {
    return activeState;
  }


  /**
   *  Gets the customizableModulesOnly attribute of the PermissionCategoryList
   *  object
   *
   *@return    The customizableModulesOnly value
   */
  public boolean getCustomizableModulesOnly() {
    return customizableModulesOnly;
  }


  /**
   *  Sets the customizableModulesOnly attribute of the PermissionCategoryList
   *  object
   *
   *@param  customizableModulesOnly  The new customizableModulesOnly value
   */
  public void setCustomizableModulesOnly(boolean customizableModulesOnly) {
    this.customizableModulesOnly = customizableModulesOnly;
  }


  /**
   *  Description of the Method
   *
   *@param  db                Description of the Parameter
   *@exception  SQLException  Description of the Exception
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
        "SELECT COUNT(*) AS recordcount " +
        "FROM permission_category pc " +
        "WHERE pc.category_id > 0 ");
    createFilter(sqlFilter);
    if (pagedListInfo != null) {
      //Get the total number of records matching filter
      pst = db.prepareStatement(sqlCount.toString() +
          sqlFilter.toString());
      items = prepareFilter(pst);
      rs = pst.executeQuery();
      if (rs.next()) {
        int maxRecords = rs.getInt("recordcount");
        pagedListInfo.setMaxRecords(maxRecords);
      }
      pst.close();
      rs.close();

      //Determine the offset, based on the filter, for the first record to show
      if (!pagedListInfo.getCurrentLetter().equals("")) {
        pst = db.prepareStatement(sqlCount.toString() +
            sqlFilter.toString() +
            "AND pc.category < ? ");
        items = prepareFilter(pst);
        pst.setString(++items, pagedListInfo.getCurrentLetter().toLowerCase());
        rs = pst.executeQuery();
        if (rs.next()) {
          int offsetCount = rs.getInt("recordcount");
          pagedListInfo.setCurrentOffset(offsetCount);
        }
        rs.close();
        pst.close();
      }

      //Determine column to sort by
      pagedListInfo.setDefaultSort("pc.level, pc.category", null);
      pagedListInfo.appendSqlTail(db, sqlOrder);
    } else {
      sqlOrder.append("ORDER BY pc.level, pc.category ");
    }

    //Need to build a base SQL statement for returning records
    if (pagedListInfo != null) {
      pagedListInfo.appendSqlSelectHead(db, sqlSelect);
    } else {
      sqlSelect.append("SELECT ");
    }
    sqlSelect.append(
        "* " +
        "FROM permission_category pc " +
        "WHERE pc.category_id > 0 ");
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
      PermissionCategory thisCategory = new PermissionCategory(rs);
      this.add(thisCategory);
    }
    rs.close();
    pst.close();
  }


  /**
   *  Description of the Method
   *
   *@param  sqlFilter  Description of the Parameter
   */
  private void createFilter(StringBuffer sqlFilter) {
    if (enabledState != -1) {
      sqlFilter.append("AND enabled = ? ");
    }
    if (activeState != -1) {
      sqlFilter.append("AND active = ? ");
    }
    if (customizableModulesOnly) {
      sqlFilter.append("AND (lookups = ? OR folders = ?) ");
    }
  }


  /**
   *  Description of the Method
   *
   *@param  pst               Description of the Parameter
   *@return                   Description of the Return Value
   *@exception  SQLException  Description of the Exception
   */
  private int prepareFilter(PreparedStatement pst) throws SQLException {
    int i = 0;
    if (enabledState != -1) {
      pst.setBoolean(++i, enabledState == Constants.TRUE);
    }
    if (activeState != -1) {
      pst.setBoolean(++i, activeState == Constants.TRUE);
    }
    if (customizableModulesOnly) {
      pst.setBoolean(++i, true);
      pst.setBoolean(++i, true);
    }
    return i;
  }

}


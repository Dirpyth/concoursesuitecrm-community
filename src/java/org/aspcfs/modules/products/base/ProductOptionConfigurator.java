package org.aspcfs.modules.products.base;

import com.darkhorseventures.framework.beans.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.aspcfs.utils.DatabaseUtils;
import org.aspcfs.utils.DateUtils;
import com.zeroio.iteam.base.FileItem;
import com.zeroio.iteam.base.FileItemList;
import org.aspcfs.modules.contacts.base.*;
import org.aspcfs.modules.troubletickets.base.*;
import org.aspcfs.modules.tasks.base.TaskList;
import org.aspcfs.modules.base.Constants;
import org.aspcfs.modules.base.Dependency;
import org.aspcfs.modules.base.DependencyList;
import org.aspcfs.modules.actionlist.base.ActionList;
import org.aspcfs.modules.actionlist.base.ActionItemLog;
import org.aspcfs.modules.actionlist.base.ActionItemLogList;
import org.aspcfs.modules.base.CustomFieldRecordList;

/**
 *  Option Configurator for an Product Option
 *
 *@author     partha
 *@created    March 19, 2004
 *@version    $Id: ProductOptionConfigurator.java,v 1.1.2.2 2004/03/19 20:46:01
 *      partha Exp $
 */
public class ProductOptionConfigurator extends GenericBean {

  private int id = -1;
  private String shortDescription = null;
  private String longDescription = null;
  private String className = null;
  private int resultType = -1;
  //other supplimentary fields
  private String optionName = null;
  private String productName = null;


  /**
   *  Gets the id attribute of the ProductOptionConfigurator object
   *
   *@return    The id value
   */
  public int getId() {
    return id;
  }


  /**
   *  Gets the shortDescription attribute of the ProductOptionConfigurator
   *  object
   *
   *@return    The shortDescription value
   */
  public String getShortDescription() {
    return shortDescription;
  }


  /**
   *  Gets the longDescription attribute of the ProductOptionConfigurator object
   *
   *@return    The longDescription value
   */
  public String getLongDescription() {
    return longDescription;
  }


  /**
   *  Gets the className attribute of the ProductOptionConfigurator object
   *
   *@return    The className value
   */
  public String getClassName() {
    return className;
  }


  /**
   *  Gets the resultType attribute of the ProductOptionConfigurator object
   *
   *@return    The resultType value
   */
  public int getResultType() {
    return resultType;
  }


  /**
   *  Gets the optionName attribute of the ProductOptionConfigurator object
   *
   *@return    The optionName value
   */
  public String getOptionName() {
    return optionName;
  }


  /**
   *  Gets the productName attribute of the ProductOptionConfigurator object
   *
   *@return    The productName value
   */
  public String getProductName() {
    return productName;
  }


  /**
   *  Sets the id attribute of the ProductOptionConfigurator object
   *
   *@param  tmp  The new id value
   */
  public void setId(int tmp) {
    this.id = tmp;
  }


  /**
   *  Sets the id attribute of the ProductOptionConfigurator object
   *
   *@param  tmp  The new id value
   */
  public void setId(String tmp) {
    this.id = Integer.parseInt(tmp);
  }


  /**
   *  Sets the shortDescription attribute of the ProductOptionConfigurator
   *  object
   *
   *@param  tmp  The new shortDescription value
   */
  public void setShortDescription(String tmp) {
    this.shortDescription = tmp;
  }


  /**
   *  Sets the longDescription attribute of the ProductOptionConfigurator object
   *
   *@param  tmp  The new longDescription value
   */
  public void setLongDescription(String tmp) {
    this.longDescription = tmp;
  }


  /**
   *  Sets the className attribute of the ProductOptionConfigurator object
   *
   *@param  tmp  The new className value
   */
  public void setClassName(String tmp) {
    this.className = tmp;
  }


  /**
   *  Sets the resultType attribute of the ProductOptionConfigurator object
   *
   *@param  tmp  The new resultType value
   */
  public void setResultType(int tmp) {
    this.resultType = tmp;
  }


  /**
   *  Sets the resultType attribute of the ProductOptionConfigurator object
   *
   *@param  tmp  The new resultType value
   */
  public void setResultType(String tmp) {
    this.resultType = Integer.parseInt(tmp);
  }


  /**
   *  Sets the optionName attribute of the ProductOptionConfigurator object
   *
   *@param  tmp  The new optionName value
   */
  public void setOptionName(String tmp) {
    this.optionName = tmp;
  }


  /**
   *  Sets the productName attribute of the ProductOptionConfigurator object
   *
   *@param  tmp  The new productName value
   */
  public void setProductName(String tmp) {
    this.productName = tmp;
  }


  /**
   *  Constructor for the ProductOptionConfigurator object
   */
  public ProductOptionConfigurator() { }


  /**
   *  Constructor for the ProductOptionConfigurator object
   *
   *@param  db                Description of the Parameter
   *@param  id                Description of the Parameter
   *@exception  SQLException  Description of the Exception
   */
  public ProductOptionConfigurator(Connection db, int id) throws SQLException {
    queryRecord(db, id);
  }


  /**
   *  Constructor for the ProductOptionConfigurator object
   *
   *@param  rs                Description of the Parameter
   *@exception  SQLException  Description of the Exception
   */
  public ProductOptionConfigurator(ResultSet rs) throws SQLException {
    buildRecord(rs);
  }


  /**
   *  Description of the Method
   *
   *@param  db                Description of the Parameter
   *@param  id                Description of the Parameter
   *@exception  SQLException  Description of the Exception
   */
  public void queryRecord(Connection db, int id) throws SQLException {
    if (id == -1) {
      throw new SQLException("Invalid Product Category Number");
    }

    PreparedStatement pst = db.prepareStatement(
        " SELECT " +
        " poptconf.*, " +
        " popt.short_description AS option_name, " +
        " pctlg.product_name AS product_name, " +
        " FROM product_option_configurator AS poptconf" +
        " LEFT JOIN product_option AS popt " +
        " ON ( poptconf.configurator_id = popt.configurator_id ) " +
        " LEFT JOIN product_option_map AS poptmap " +
        " ON ( popt.option_id = poptmap.option_id ) " +
        " LEFT JOIN product_catalog AS pctlg " +
        " ON ( poptmap.product_id = pctlg.product_id ) " +
        " WHERE pconf.configurator_id = ? "
        );
    pst.setInt(1, id);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
      buildRecord(rs);
    }
    rs.close();
    pst.close();
    if (this.id == -1) {
      throw new SQLException("Product Category not found");
    }
  }


  /**
   *  Description of the Method
   *
   *@param  rs                Description of the Parameter
   *@exception  SQLException  Description of the Exception
   */
  private void buildRecord(ResultSet rs) throws SQLException {
    // product_option_configurator table
    this.setId(rs.getInt("configurator_id"));
    this.setShortDescription(rs.getString("short_description"));
    this.setLongDescription(rs.getString("long_description"));
    this.setClassName(rs.getString("class_name"));
    this.setResultType(DatabaseUtils.getInt(rs, "result_type"));

    // product_option table
    this.setOptionName(rs.getString("option_name"));

    // product_catalog table
    this.setProductName(rs.getString("product_name"));
  }


  /**
   *  Description of the Method
   *
   *@param  db                Description of the Parameter
   *@param  baseFilePath      Description of the Parameter
   *@return                   Description of the Return Value
   *@exception  SQLException  Description of the Exception
   */
  public boolean delete(Connection db, String baseFilePath) throws SQLException {
    boolean result = false;
    if (this.getId() == -1) {
      throw new SQLException("Product Category ID not specified.");
    }
    try {
      db.setAutoCommit(false);
      /*
       *  /Delete any documents
       *  FileItemList fileList = new FileItemList();
       *  fileList.setLinkModuleId(Constants.DOCUMENTS_PRODUCT_CATEGORY);
       *  fileList.setLinkItemId(this.getId());
       *  fileList.buildList(db);
       *  fileList.delete(db, baseFilePath);
       *  fileList = null;
       *  /Delete any folder data
       *  CustomFieldRecordList folderList = new CustomFieldRecordList();
       *  folderList.setLinkModuleId(Constants.FOLDERS_PRODUCT_CATEGORY);
       *  folderList.setLinkItemId(this.getId());
       *  folderList.buildList(db);
       *  folderList.delete(db);
       *  folderList = null;
       */
      //delete all the dependencies that contain the product_option_configurator id

      //delete the product_option_configurator s that have configurator_id = id
      int i = 0;
      PreparedStatement pst = db.prepareStatement(
          " DELETE from product_option_configurator " +
          " WHERE configurator_id = ? "
          );
      pst.setInt(++i, this.getId());
      pst.execute();
      pst.close();
      db.commit();
      result = true;
    } catch (SQLException e) {
      db.rollback();
    } finally {
      db.setAutoCommit(true);
    }
    return result;
  }


  /**
   *  Description of the Method
   *
   *@param  db                Description of the Parameter
   *@return                   Description of the Return Value
   *@exception  SQLException  Description of the Exception
   */
  public boolean insert(Connection db) throws SQLException {
    boolean result = false;
    StringBuffer sql = new StringBuffer();
    try {
      db.setAutoCommit(false);
      sql.append(
          " INSERT INTO product_option_configurator(  " +
          "  short_description, long_description, class_name, result_type ) "
          );
      sql.append("VALUES ( ?,?,?,? )");
      int i = 0;
      PreparedStatement pst = db.prepareStatement(sql.toString());
      pst.setString(++i, this.getShortDescription());
      pst.setString(++i, this.getLongDescription());
      pst.setString(++i, this.getClassName());
      DatabaseUtils.setInt(pst, ++i, this.getResultType());
      pst.execute();
      pst.close();
      id = DatabaseUtils.getCurrVal(db, "product_option_configurator_configurator_id_seq");
      db.commit();
      result = true;
    } catch (SQLException e) {
      db.rollback();
      throw new SQLException(e.getMessage());
    } finally {
      db.setAutoCommit(true);
    }
    return result;
  }


  /**
   *  Description of the Method
   *
   *@param  db                Description of the Parameter
   *@return                   Description of the Return Value
   *@exception  SQLException  Description of the Exception
   */
  public int update(Connection db) throws SQLException {
    int resultCount = 0;
    if (!isValid(db)) {
      return -1;
    }
    PreparedStatement pst = null;
    StringBuffer sql = new StringBuffer();
    sql.append(
        " UPDATE product_option_configurator SET " +
        " short_description = ?, long_description = ?, class_name = ?, " +
        " result_type = ? "
        );
    sql.append(" WHERE configurator_id = ? ");

    int i = 0;
    pst = db.prepareStatement(sql.toString());
    pst.setString(++i, this.getShortDescription());
    pst.setString(++i, this.getLongDescription());
    pst.setString(++i, this.getClassName());
    pst.setInt(++i, this.getResultType());
    resultCount = pst.executeUpdate();
    pst.close();
    return resultCount;
  }


  /**
   *  Gets the valid attribute of the ProductOptionConfigurator object
   *
   *@param  db                Description of the Parameter
   *@return                   The valid value
   *@exception  SQLException  Description of the Exception
   */
  public boolean isValid(Connection db) throws SQLException {
// This method contains additional error catching statements
    if (id == -1) {
      return false;
    }
    return true;
  }


  /**
   *  Description of the Method
   *
   *@param  db                Description of the Parameter
   *@return                   Description of the Return Value
   *@exception  SQLException  Description of the Exception
   */
  public DependencyList processDependencies(Connection db) throws SQLException {
    // This method checks all the mappings for any product_option_configurator with the current id
    // The currently known mappings are product_option_configurator_map, product_catalog_category_map
    if (this.getId() == -1) {
      throw new SQLException("Configurator ID not specified");
    }
    String sql = null;
    DependencyList dependencyList = new DependencyList();
    PreparedStatement pst = null;
    ResultSet rs = null;
    int i = 0;
    /*
     *  /Check for documents
     *  Dependency docDependency = new Dependency();
     *  docDependency.setName("Documents");
     *  docDependency.setCount(FileItemList.retrieveRecordCount(db, Constants.DOCUMENTS_PRODUCT_CATEGORY, this.getId()));
     *  docDependency.setCanDelete(true);
     *  dependencyList.add(docDependency);
     *  /Check for folders
     *  Dependency folderDependency = new Dependency();
     *  folderDependency.setName("Folders");
     *  folderDependency.setCount(CustomFieldRecordList.retrieveRecordCount(db, Constants.FOLDERS_PRODUCT_CATEGORY, this.getId()));
     *  folderDependency.setCanDelete(true);
     *  dependencyList.add(folderDependency);
     */
    //Check for product_option with configurator_id = id
    try {
      i = 0;
      pst = db.prepareStatement(
          "SELECT count(*) as parentcount " +
          " FROM product_option " +
          "WHERE configurator_id = ?"
          );
      pst.setInt(++i, this.getId());
      rs = pst.executeQuery();
      if (rs.next()) {
        int categoryCount = rs.getInt("parentcount");
        if (categoryCount != 0) {
          Dependency thisDependency = new Dependency();
          thisDependency.setName("Number of children of this category ");
          thisDependency.setCount(categoryCount);
          thisDependency.setCanDelete(false);
          dependencyList.add(thisDependency);
        }
      }
      rs.close();
      pst.close();
    } catch (SQLException e) {
    }
    return dependencyList;
  }
}

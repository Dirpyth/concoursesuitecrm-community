package org.aspcfs.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import java.util.Properties;
import org.jcrontab.*;
import org.aspcfs.utils.StringUtils;
import com.darkhorseventures.framework.actions.*;
import com.darkhorseventures.database.*;

/**
 *  Loads and saves the build.properties file for application settings
 *
 *@author     matt rajkowski
 *@created    August 27, 2003
 *@version    $Id: ApplicationPrefs.java,v 1.1.2.2 2003/08/28 21:03:45
 *      mrajkowski Exp $
 */
public class ApplicationPrefs {

  public final static String fs = System.getProperty("file.separator");
  public final static String ls = System.getProperty("line.separator");
  public final static String GENERATED_MESSAGE = 
      "### GENERATED BY org.aspcfs.controller.ApplicationPrefs";
  private Map prefs = new LinkedHashMap();
  private String filename = null;


  /**
   *  Constructor for the ApplicationPrefs object
   */
  public ApplicationPrefs() { }


  /**
   *  Constructor for the ApplicationPrefs object
   *
   *@param  filename  Description of the Parameter
   */
  public ApplicationPrefs(String filename) {
    load(filename);
  }


  /**
   *  Sets the filename attribute of the ApplicationPrefs object
   *
   *@param  tmp  The new filename value
   */
  public void setFilename(String tmp) {
    this.filename = tmp;
  }


  /**
   *  Gets the filename attribute of the ApplicationPrefs object
   *
   *@return    The filename value
   */
  public String getFilename() {
    return filename;
  }


  /**
   *  Gets the prefs attribute of the ApplicationPrefs object
   *
   *@return    The prefs value
   */
  public Map getPrefs() {
    return prefs;
  }


  /**
   *  Description of the Method
   *
   *@param  filename  Description of the Parameter
   */
  public void load(String filename) {
    if (System.getProperty("DEBUG") != null) {
      System.out.println("ApplicationPrefs-> Loading prefs: " + filename);
    }
    this.filename = filename;
    try {
      prefs.clear();
      BufferedReader in = new BufferedReader(new FileReader(filename));
      String line = null;
      int count = 0;
      while ((line = in.readLine()) != null) {
        ++count;
        if (!line.startsWith("#") && line.indexOf("=") > 0) {
          String param = line.substring(0, line.indexOf("="));
          String value = "";
          if (line.indexOf("=") + 1 < line.length()) {
            value = line.substring(line.indexOf("=") + 1);
          }
          this.add(param, value);
        } else if (!line.startsWith(GENERATED_MESSAGE)) {
          this.add("#" + count, line);
        }
      }
      in.close();
    } catch (Exception e) {
      System.out.println("ApplicationPrefs-> EXCEPTION: " + e.getMessage());
    }
    if (System.getProperty("DEBUG") != null) {
      System.out.println("ApplicationPrefs-> Loaded items: " + prefs.size());
    }
  }


  /**
   *  Description of the Method
   *
   *@param  param  Description of the Parameter
   *@return        Description of the Return Value
   */
  public String get(String param) {
    return (String) prefs.get(param);
  }


  /**
   *  Description of the Method
   *
   *@param  param  Description of the Parameter
   *@return        Description of the Return Value
   */
  public boolean has(String param) {
    return (prefs.containsKey(param));
  }


  /**
   *  Description of the Method
   */
  public void clear() {
    prefs.clear();
  }


  /**
   *  Description of the Method
   *
   *@param  param  Description of the Parameter
   *@param  value  Description of the Parameter
   */
  public void add(String param, String value) {
    if (param != null) {
      if (value != null) {
        prefs.put(param, value);
      } else {
        prefs.remove(param);
      }
    }
  }


  /**
   *  Description of the Method
   *
   *@return    Description of the Return Value
   */
  public boolean save() {
    if (filename != null) {
      return save(filename);
    }
    return false;
  }


  /**
   *  Saves the preferences to a file to be reloaded
   *
   *@param  filename  Description of the Parameter
   *@return           Description of the Return Value
   */
  public boolean save(String filename) {
    try {
      BufferedWriter out = new BufferedWriter(new FileWriter(filename));
      out.write(GENERATED_MESSAGE + " on " + new java.util.Date() + " ###" + ls);
      Iterator i = prefs.keySet().iterator();
      while (i.hasNext()) {
        String param = (String) i.next();
        String value = (String) prefs.get(param);
        if (param.startsWith("#")) {
          out.write(value + ls);
        } else {
          out.write(param + "=" + value + ls);
        }
      }
      out.close();
      return true;
    } catch (Exception e) {
      return false;
    }
  }


  /**
   *  Description of the Method
   *
   *@param  context  Description of the Parameter
   */
  public void populateContext(ServletContext context) {
    //Configure debug mode
    if (this.has("DEBUGLEVEL")) {
      System.setProperty("DEBUG", this.get("DEBUGLEVEL"));
    }
    //Turn off Setup if setup is complete
    if (this.has("CONTROL")) {
      context.setAttribute("cfs.setup", "true");
    }
    //Configure the fileLibrary
    if (!this.has("FILELIBRARY")) {
      this.add("FILELIBRARY", (String) context.getAttribute("FileLibrary"));
    }
    //Verify the WEB-INF if set
    if (this.has("WEB-INF")) {
      if (!this.get("WEB-INF").equals(context.getRealPath("/") + "WEB-INF" + fs)) {
        save();
      }
    }
    //Configure the database
    addParameter(context, "SiteCode", this.get("GATEKEEPER.APPCODE"));
    addParameter(context, "GKDRIVER", this.get("GATEKEEPER.DRIVER"));
    addParameter(context, "GKHOST", this.get("GATEKEEPER.URL"));
    addParameter(context, "GKUSER", this.get("GATEKEEPER.USER"));
    addParameter(context, "GKUSERPW", this.get("GATEKEEPER.PASSWORD"));
    //Define the ConnectionPool, else defaults from the ContextListener will be used
    ConnectionPool cp = (ConnectionPool) context.getAttribute("ConnectionPool");
    if (cp != null) {
      if (this.has("CONNECTION_POOL.DEBUG")) {
        cp.setDebug(this.get("CONNECTION_POOL.DEBUG"));
      }
      if (this.has("CONNECTION_POOL.TEST_CONNECTIONS")) {
        cp.setTestConnections(this.get("CONNECTION_POOL.TEST_CONNECTIONS"));
      }
      if (this.has("CONNECTION_POOL.ALLOW_SHRINKING")) {
        cp.setAllowShrinking(this.get("CONNECTION_POOL.ALLOW_SHRINKING"));
      }
      if (this.has("CONNECTION_POOL.MAX_CONNECTIONS")) {
        cp.setMaxConnections(this.get("CONNECTION_POOL.MAX_CONNECTIONS"));
      }
      if (this.has("CONNECTION_POOL.MAX_IDLE_TIME.SECONDS")) {
        cp.setMaxIdleTimeSeconds(this.get("CONNECTION_POOL.MAX_IDLE_TIME.SECONDS"));
      }
      if (this.has("CONNECTION_POOL.MAX_DEAD_TIME.SECONDS")) {
        cp.setMaxDeadTimeSeconds(this.get("CONNECTION_POOL.MAX_DEAD_TIME.SECONDS"));
      }
    }
    //Define whether the app requires SSL for browser clients
    addParameter(context, "ForceSSL", this.get("FORCESSL"), "false");
    //Define the developer's debug code
    addParameter(context, "GlobalPWInfo", this.get("WEBSERVER.PASSWORD"), "#notspecified");
    //Define the web server operation mode
    addParameter(context, "WEBSERVER.ASPMODE", this.get("WEBSERVER.ASPMODE"));
    //Define the mail server to be used within CFS
    addParameter(context, "MailServer", this.get("MAILSERVER"));
    addParameter(context, "FaxServer", this.get("FAXSERVER"));
    addParameter(context, "SYSTEM.TIMEZONE", this.get("SYSTEM.TIMEZONE"));
    if (this.has("MAILSERVER")) {
      System.setProperty("MailServer", this.get("MAILSERVER"));
    }
    //Start the cron last
    if ("true".equals(this.get("CRON.ENABLED"))) {
      try {
        System.out.println("InitHook-> Starting CRON");
        Crontab crontab = Crontab.getInstance();
        Properties jcronProperties = new Properties();
        jcronProperties.setProperty("org.jcrontab.Crontab.refreshFrequency", "3");
        //Specify the cron items are in the gatekeeper database
        jcronProperties.setProperty("org.jcrontab.data.datasource", "org.aspcfs.jcrontab.datasource.CFSDatasource");
        jcronProperties.setProperty("org.jcrontab.data.GenericSQLSource.driver", StringUtils.toString((String) context.getAttribute("GKDRIVER")));
        jcronProperties.setProperty("org.jcrontab.data.GenericSQLSource.url", StringUtils.toString((String) context.getAttribute("GKHOST")));
        jcronProperties.setProperty("org.jcrontab.data.GenericSQLSource.username", StringUtils.toString((String) context.getAttribute("GKUSER")));
        jcronProperties.setProperty("org.jcrontab.data.GenericSQLSource.password", StringUtils.toString((String) context.getAttribute("GKUSERPW")));
        jcronProperties.setProperty("org.jcrontab.path.DefaultFilePath", StringUtils.toString((String) context.getAttribute("FileLibrary")));
        if (this.has("WEBSERVER.URL")) {
          jcronProperties.setProperty("org.jcrontab.path.WebServerUrl", this.get("WEBSERVER.URL"));
        } else {
          jcronProperties.setProperty("org.jcrontab.path.WebServerUrl", "127.0.0.1");
        }
        //jcron logger -- TODO: implement a database logger
        jcronProperties.setProperty("org.jcrontab.log.Logger", "org.jcrontab.log.DebugLogger");
        crontab.setConnectionPool(cp);
        crontab.setServletContext(context);
        crontab.init(jcronProperties);
        context.setAttribute("Crontab", crontab);
      } catch (Exception e) {
        e.printStackTrace(System.err);
      }
    }
  }


  /**
   *  Adds a feature to the Parameter attribute of the InitHook object
   *
   *@param  context  The feature to be added to the Parameter attribute
   *@param  param    The feature to be added to the Parameter attribute
   *@param  value    The feature to be added to the Parameter attribute
   */
  private void addParameter(ServletContext context, String param, String value) {
    addParameter(context, param, value, null);
  }


  /**
   *  Adds a feature to the Parameter attribute of the InitHook object
   *
   *@param  context       The feature to be added to the Parameter attribute
   *@param  param         The feature to be added to the Parameter attribute
   *@param  value         The feature to be added to the Parameter attribute
   *@param  defaultValue  The feature to be added to the Parameter attribute
   */
  private void addParameter(ServletContext context, String param, String value, String defaultValue) {
    if (value != null) {
      context.setAttribute(param, value);
    } else {
      if (defaultValue != null) {
        context.setAttribute(param, defaultValue);
      } else {
        context.removeAttribute(param);
      }
    }
  }


  /**
   *  Gets the pref attribute of the ApplicationPrefs class
   *
   *@param  context  Description of the Parameter
   *@param  param    Description of the Parameter
   *@return          The pref value
   */
  public static String getPref(ServletContext context, String param) {
    ApplicationPrefs prefs = (ApplicationPrefs) context.getAttribute("APPLICATION.PREFS");
    if (prefs != null) {
      return prefs.get(param);
    } else {
      return null;
    }
  }
}


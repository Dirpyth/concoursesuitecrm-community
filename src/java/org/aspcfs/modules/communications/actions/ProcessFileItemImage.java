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
package org.aspcfs.modules.communications.actions;

import javax.servlet.*;
import javax.servlet.http.*;
import com.darkhorseventures.framework.actions.*;
import java.sql.*;
import java.util.*;
import org.aspcfs.modules.actions.CFSModule;
import org.aspcfs.utils.web.*;
import com.zeroio.iteam.base.*;
import com.zeroio.webutils.*;
import com.isavvix.tools.*;
import java.io.*;
import org.aspcfs.modules.login.base.AuthenticationItem;

/**
 *  A stand alone servlet that sends files. Currently it will stream an image
 *  file from a protected image library
 *
 *@author     mrajkowski
 *@created    April 1, 2004
 *@version    $Id: ProcessFileItemImage.java,v 1.3 2004/08/04 20:01:57
 *      mrajkowski Exp $
 */
public final class ProcessFileItemImage extends CFSModule {

  public final static String PROCESS_FILE_ITEM_NAME = "processFileItemImages";


  /**
   *  Receives a request for a FileItem image and processes it.<br>
   *  The user must have access to see the image in their session, then the
   *  image is retrieved. Images are stored in the fileLibrary using the cryptic
   *  datetime filename without an extension<p>
   *
   *  The url format should be in the following format:<br>
   *  <img src="http://ds21.darkhorseventures.com/ProcessFileItemImage.do?id=">
   *  <p>
   *
   *
   *
   *@param  context  Description of the Parameter
   *@return          Description of the Return Value
   */
  public String executeCommandDefault(ActionContext context) {
    String id = (String) context.getRequest().getParameter("id");
    String path = (String) context.getRequest().getParameter("path");
    String version = (String) context.getRequest().getParameter("version");

    FileItem thisItem = null;
    // Lookup the file, start the download
    Connection db = null;
    try {
      // See if the id is in the user's session
      ArrayList allowedImages = (ArrayList) context.getSession().getAttribute(PROCESS_FILE_ITEM_NAME);
      if (allowedImages == null || !allowedImages.contains(id + (version != null ? "-" + version : ""))) {
        return ("-none-");
      }
      // Get a database connection using the virtual host context info
      AuthenticationItem auth = new AuthenticationItem();
      db = auth.getConnection(context, false);
      // Load the fileItem
      FileItem fileItem = new FileItem(db, Integer.parseInt(id));
      // Prepare to download
      String filePath = null;
      if (version != null) {
        fileItem.buildVersionList(db);
        FileItemVersion thisVersion = fileItem.getVersion(Double.parseDouble(version));
        filePath = this.getPath(context, path) + getDatePath(thisVersion.getModified()) + thisVersion.getFilename();
      } else {
        filePath = this.getPath(context, path) + getDatePath(fileItem.getModified()) + fileItem.getFilename();
      }
      // Finished with connection
      this.freeConnection(context, db);
      db = null;

      FileDownload fileDownload = new FileDownload();
      fileDownload.setFullPath(filePath);
      fileDownload.setDisplayName(fileItem.getClientFilename());
      if (fileDownload.fileExists()) {
        fileDownload.streamContent(context);
      } else {
        System.err.println("Image-> Trying to send a file that does not exist: " + filePath + fileItem.getClientFilename());
      }
    } catch (java.net.SocketException se) {
      //User either canceled the download or lost connection
    } catch (Exception e) {
      //System.out.println(e.toString());
      e.printStackTrace(System.out);
    } finally {
      if (db != null) {
        this.freeConnection(context, db);
      }
    }
    return ("-none-");
  }
}


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
package org.aspcfs.utils;

import java.io.*;
import java.util.StringTokenizer;
import java.util.Locale;
import java.text.NumberFormat;
import javax.servlet.ServletContext;

/**
 *  Helper methods for dealing with file operations
 *
 *@author     matt rajkowski
 *@created    August 25, 2003
 *@version    $Id$
 */
public class FileUtils {

  /**
   *  Copies the specified source file to the destination file
   *
   *@param  sourceFile       Description of the Parameter
   *@param  destinationFile  Description of the Parameter
   *@return                  Description of the Return Value
   */
  public static boolean copyFile(File sourceFile, File destinationFile) {
    return copyFile(sourceFile, destinationFile, true);
  }


  /**
   *  Description of the Method
   *
   *@param  sourceFile       Description of the Parameter
   *@param  destinationFile  Description of the Parameter
   *@param  overwrite        Description of the Parameter
   *@return                  Description of the Return Value
   */
  public static boolean copyFile(File sourceFile, File destinationFile, boolean overwrite) {
    //Check to see if source exists
    if (!sourceFile.exists()) {
      return false;
    }
    //If destination is a directory then set it as a file
    String fs = System.getProperty("file.separator");
    if (destinationFile.isDirectory()) {
      destinationFile = new File(destinationFile.getPath() + fs + sourceFile.getName());
    }
    //Check to see if source and destination file are the same
    if (sourceFile.equals(destinationFile)) {
      return false;
    }
    //Skip if overwrite is false
    if (!overwrite) {
      if (destinationFile.exists()) {
        return true;
      }
    }
    //Copy the file
    FileInputStream source = null;
    FileOutputStream destination = null;
    try {
      source = new FileInputStream(sourceFile);
      destination = new FileOutputStream(destinationFile);
      byte[] buffer = new byte[4096];
      int read = -1;
      while ((read = source.read(buffer)) != -1) {
        destination.write(buffer, 0, read);
      }
    } catch (Exception e) {
      e.printStackTrace(System.out);
      return false;
    } finally {
      if (destination != null) {
        try {
          destination.close();
        } catch (IOException io) {
        }
      }
      if (source != null) {
        try {
          source.close();
        } catch (IOException io) {
        }
      }
    }
    return true;
  }


  /**
   *  Description of the Method
   *
   *@param  context          Description of the Parameter
   *@param  filename         Description of the Parameter
   *@param  destinationFile  Description of the Parameter
   *@param  overwrite        Description of the Parameter
   *@return                  Description of the Return Value
   *@exception  IOException  Description of the Exception
   */
  public static boolean copyFile(ServletContext context, String filename, File destinationFile, boolean overwrite) throws IOException {
    //If destination is a directory then set it as a file
    String fs = System.getProperty("file.separator");
    if (destinationFile.isDirectory()) {
      File sourceFile = new File(filename);
      destinationFile = new File(destinationFile.getPath() + fs + sourceFile.getName());
    }
    //Skip if overwrite is false
    if (!overwrite) {
      if (destinationFile.exists()) {
        return true;
      }
    }
    //Copy the file
    InputStream source = context.getResourceAsStream(filename);
    FileOutputStream destination = null;
    try {
      destination = new FileOutputStream(destinationFile);
      byte[] buffer = new byte[4096];
      int read = -1;
      while ((read = source.read(buffer)) != -1) {
        destination.write(buffer, 0, read);
      }
    } catch (Exception e) {
      e.printStackTrace(System.out);
      return false;
    } finally {
      if (destination != null) {
        try {
          destination.close();
        } catch (IOException io) {
        }
      }
    }
    return true;
  }


  /**
   *  Gets the bytes free on the system for the specified directory
   *
   *@param  dir  Description of the Parameter
   *@return      The freeBytes value
   */
  public static long getFreeBytes(String dir) {
    long free = -1;
    String[] command = null;
    // Create OS-specific command to get available space
    File osCheckFile = new File("/bin/sh");
    if (osCheckFile.exists()) {
      // Linux, Unix, Mac OSX
      dir = StringUtils.replace(dir, " ", "\\ ");
      command = new String[]{"/bin/sh", "-c", "df " + dir};
    } else {
      // Windows
      command = new String[]{"cmd", "/C", "dir", dir};
    }
    // Invoke the OS-specific command and parse the results
    Process process;
    String line = null;
    String thisLine = null;
    try {
      int blockSize = 1024;
      process = Runtime.getRuntime().exec(command);
      BufferedReader in =
          new BufferedReader(
          new InputStreamReader(process.getInputStream()));
      while ((thisLine = in.readLine()) != null) {
        line = thisLine;
        // Using df, the block size must be incorporated
        if (line.indexOf("512-blocks") > -1) {
          blockSize = 512;
        }
        // On Windows NT, last line contains the available space
        if (line.endsWith("bytes free")) {
          if (line.indexOf("Dir(s)") > -1) {
            line = line.substring(line.indexOf("Dir(s)"));
          }
          // The number is formatted with commas, so extract just the numeric portion
          StringBuffer sb = new StringBuffer();
          for (int i = 0; i < line.length(); i++) {
            char ch = line.charAt(i);
            if (Character.isDigit(ch)) {
              sb.append(ch);
            }
          }
          // Convert string to long
          free = Long.parseLong(sb.toString());
          line = null;
          break;
        }
      }
      in.close();
      // On Linux, the last line contains the free space, 3rd from the last
      if (line != null) {
        StringTokenizer st = new StringTokenizer(line, " ");
        int items = st.countTokens();
        for (int i = 0; i < items - 3; i++) {
          st.nextToken();
        }
        //Get the 3rd from the last token
        free = Long.parseLong(st.nextToken()) * blockSize;
      }
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    return free;
  }


  /**
   *  Deletes all files and subdirectories under dir. Returns true if all
   *  deletions were successful. If a deletion fails, the method stops
   *  attempting to delete and returns false.<p>
   *
   *  re: Java Developers Almanac 1.4
   *
   *@param  dir  Description of the Parameter
   *@return      Description of the Return Value
   */
  public static boolean deleteDirectory(File dir) {
    if (dir.isDirectory()) {
      String[] children = dir.list();
      for (int i = 0; i < children.length; i++) {
        boolean success = deleteDirectory(new File(dir, children[i]));
        if (!success) {
          return false;
        }
      }
    }
    // The directory is now empty so delete it
    return dir.delete();
  }


  /**
   *  Checks to see if the file specified exists
   *
   *@param  fullPath  Description of the Parameter
   *@return           Description of the Return Value
   */
  public static boolean fileExists(String fullPath) {
    File thisFile = new File(fullPath);
    return thisFile.exists();
  }


  /**
   *  Gets the relativeSize attribute of the FileUtils class
   *
   *@param  size    Description of the Parameter
   *@param  locale  Description of the Parameter
   *@return         The relativeSize value
   */
  public static String getRelativeSize(float size, Locale locale) {
    if (size == -1) {
      return ("Could not be determined");
    }
    // Make the numbers look nice
    NumberFormat formatter = null;
    if (locale == null) {
      formatter = NumberFormat.getInstance();
    } else {
      formatter = NumberFormat.getInstance(locale);
    }
    // GB
    if (size > 1000000000) {
      formatter.setMaximumFractionDigits(2);
      return (formatter.format(size / 1000 / 1000 / 1000) + " GB");
    }
    // MB
    if (size > 1000000) {
      formatter.setMaximumFractionDigits(1);
      return (formatter.format(size / 1000 / 1000) + " MB");
    }
    // KB
    if (size > 1000) {
      formatter.setMaximumFractionDigits(0);
      return (formatter.format(size / 1000) + " KB");
    }
    // Bytes
    return (formatter.format(size) + " bytes");
  }
}


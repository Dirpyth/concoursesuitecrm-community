package org.aspcfs.utils;

import java.sql.*;
import java.text.*;
import java.util.*;

/**
 *  Description of the Class
 *
 *@author     matt rajkowski
 *@created    January 13, 2003
 *@version    $Id$
 */
public class DateUtils {

  /**
   *  Description of the Method
   *
   *@param  tmp  Description of the Parameter
   *@return      Description of the Return Value
   */
  public static java.sql.Date parseDateString(String tmp) {
    java.sql.Date dateValue = null;
    try {
      java.util.Date tmpDate = DateFormat.getDateInstance(DateFormat.SHORT).parse(tmp);
      dateValue = new java.sql.Date(new java.util.Date().getTime());
      dateValue.setTime(tmpDate.getTime());
      return dateValue;
    } catch (Exception e) {
      try {
        return java.sql.Date.valueOf(tmp);
      } catch (Exception e2) {
      }
    }
    return null;
  }


  /**
   *  Description of the Method
   *
   *@param  tmp  Description of the Parameter
   *@return      Description of the Return Value
   */
  public static java.sql.Timestamp parseTimestampString(String tmp) {
    java.sql.Timestamp timestampValue = null;
    try {
      java.util.Date tmpDate = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.LONG).parse(tmp);
      timestampValue = new java.sql.Timestamp(new java.util.Date().getTime());
      timestampValue.setTime(tmpDate.getTime());
      return timestampValue;
    } catch (Exception e) {
      try {
        return java.sql.Timestamp.valueOf(tmp);
      } catch (Exception e2) {
      }
    }
    return null;
  }


  /**
   *  parses special String formats into Timestamps
   *
   *@param  tmp     Description of the Parameter
   *@param  format  Description of the Parameter
   *@return         Description of the Return Value
   */
  public static java.sql.Timestamp parseTimestampString(String tmp, String format) {
    java.sql.Timestamp timestampValue = null;
    SimpleDateFormat df = null;
    df = new SimpleDateFormat(format);
    try {
      //java.util.Date tmpDate = DateFormat.getDateTimeInstance().parse(tmp);
      java.util.Date tmpDate = df.parse(tmp, new ParsePosition(0));
      timestampValue = new java.sql.Timestamp(new java.util.Date().getTime());
      timestampValue.setTime(tmpDate.getTime());
      return timestampValue;
    } catch (Exception e) {
      try {
        return java.sql.Timestamp.valueOf(tmp);
      } catch (Exception e2) {
      }
    }
    return null;
  }


  /**
   *  parses special String formats into Dates
   *
   *@param  tmp     Description of the Parameter
   *@param  format  Description of the Parameter
   *@return         Description of the Return Value
   */
  public static java.sql.Date parseDateString(String tmp, String format) {
    java.sql.Date dateValue = null;
    SimpleDateFormat df = null;
    df = new SimpleDateFormat(format);
    try {
      java.util.Date tmpDate = df.parse(tmp, new ParsePosition(0));
      dateValue = new java.sql.Date(new java.util.Date().getTime());
      dateValue.setTime(tmpDate.getTime());
      return dateValue;
    } catch (Exception e) {
      try {
        return java.sql.Date.valueOf(tmp);
      } catch (Exception e2) {
      }
    }
    return null;
  }


  /**
   *  Gets the dateString attribute of the DateUtils object
   *
   *@param  date        Description of the Parameter
   *@param  timeZone    Description of the Parameter
   *@param  dateFormat  Description of the Parameter
   *@param  timeFormat  Description of the Parameter
   *@return             The dateString value
   */
  public static String getUserToServerDateTimeString(TimeZone timeZone, int dateFormat, int timeFormat, String date) {
    String convertedDate = null;
    try {
      DateFormat localeFormatter = DateFormat.getDateInstance(dateFormat);
      if (timeZone != null) {
        localeFormatter.setTimeZone(timeZone);
      }
      DateFormat serverFormatter = DateFormat.getDateTimeInstance(dateFormat, timeFormat);
      convertedDate = serverFormatter.format(localeFormatter.parse(date));
    } catch (Exception e) {
      System.err.println("EXCEPTION: DateTimeHandler-> Timestamp ");
    }
    return convertedDate;
  }


  /**
   *  Returns the converted server time based on the current calendar time and timezone of the user
   *
   *@param  cal       Description of the Parameter
   *@param  timeZone  Description of the Parameter
   *@return           The userToServerDateTime value
   */
  public static java.sql.Timestamp getUserToServerDateTime(Calendar cal, TimeZone timeZone) {
    java.sql.Timestamp timestampValue = null;
    try {
      String date = getDateString(cal);
      DateFormat localFormatter = DateFormat.getDateInstance(DateFormat.SHORT);
      if (timeZone != null) {
        localFormatter.setTimeZone(timeZone);
      }
      timestampValue = new java.sql.Timestamp(localFormatter.parse(date).getTime());
    } catch (Exception e) {
      System.out.println("DateUtils -- > getUserToServerDateTime Exception" + e.toString());
    }
    return timestampValue;
  }


  /**
   *  Gets the serverToUserDateString attribute of the DateUtils class
   *
   *@param  timeZone    Description of the Parameter
   *@param  dateFormat  Description of the Parameter
   *@param  date        Description of the Parameter
   *@return             The serverToUserDateString value
   */
  public static String getServerToUserDateString(TimeZone timeZone, int dateFormat, java.sql.Timestamp date) {
    SimpleDateFormat formatter = null;
    try {
      //TODO: combine the Locale when User Locale that has been implemented
      formatter = (SimpleDateFormat) SimpleDateFormat.getDateInstance(dateFormat);
      formatter.applyPattern("M/d/yyyy");
      formatter.setTimeZone(timeZone);
    } catch (Exception e) {
      System.err.println("EXCEPTION: DateUtils -> Timestamp " + date);
    }
    return formatter.format((java.util.Date) date);
  }


  /**
   *  Gets the serverToUserDateTimeString attribute of the DateUtils class
   *
   *@param  timeZone    Description of the Parameter
   *@param  dateFormat  Description of the Parameter
   *@param  timeFormat  Description of the Parameter
   *@param  date        Description of the Parameter
   *@return             The serverToUserDateTimeString value
   */
  public static String getServerToUserDateTimeString(TimeZone timeZone, int dateFormat, int timeFormat, java.sql.Timestamp date) {
    SimpleDateFormat formatter = null;
    try {
      //TODO: combine the Locale when User Locale that has been implemented
      formatter = (SimpleDateFormat) SimpleDateFormat.getDateTimeInstance(dateFormat, timeFormat);
      formatter.setTimeZone(timeZone);
    } catch (Exception e) {
      System.err.println("EXCEPTION: DateUtils -> Timestamp " + date);
    }
    return formatter.format(date);
  }


  /**
   *  Returns the current time from a calendar object
   *
   *@param  cal         Description of the Parameter
   *@return             The date value
   */
  public static java.util.Date getDate(Calendar cal) {
    java.util.Date convertedDate = null;
    try {
      SimpleDateFormat formatter = (SimpleDateFormat) SimpleDateFormat.getDateInstance(DateFormat.SHORT);
      formatter.applyPattern("M/d/yyyy");
      String tmpDate = (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.DAY_OF_MONTH) + "/" + cal.get(Calendar.YEAR);
      convertedDate = formatter.parse(tmpDate);
    } catch (Exception e) {
      System.err.println("EXCEPTION: DateUtils -> Timestamp ");
    }
    return convertedDate;
  }


  /**
   *  Returns the current date of the calendar in the m/d/yyyy format as a string
   *
   *@param  cal         Description of the Parameter
   *@return             The dateString value
   */
  public static String getDateString(Calendar cal) {
    return (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.DAY_OF_MONTH) + "/" + cal.get(Calendar.YEAR);
  }
}


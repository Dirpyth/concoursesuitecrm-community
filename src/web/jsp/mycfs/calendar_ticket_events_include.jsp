<%-- draws the ticket events for a specific day --%>
<%@ taglib uri="/WEB-INF/dhv-taglib.tld" prefix="dhv" %>
<%@ page import="org.aspcfs.modules.troubletickets.base.Ticket,org.aspcfs.modules.base.Constants" %>
<%
  TicketEventList ticketEventList = (TicketEventList) thisDay.get(category);
%>

<%-- include tickets --%>
<dhv:evaluate if="<%= ticketEventList.getOpenProductTickets().size() > 0 %>">
<table border="0">
  <tr>
    <td colspan="6">
      <%-- event name --%>
      <img border="0" src="images/box.gif" align="texttop" title="Tickets"><a href="javascript:changeImages('productticketsimage<%=toFullDateString(thisDay.getDate()) %>','images/arrowdown.gif','images/arrowright.gif');javascript:switchStyle(document.getElementById('productticketsdetails<%=toFullDateString(thisDay.getDate()) %>'));" onMouseOver="window.status='View Details';return true;" onMouseOut="window.status='';return true;"><img src="<%= firstEvent ? "images/arrowdown.gif" : "images/arrowright.gif"%>" name="productticketsimage<%=toFullDateString(thisDay.getDate())%>" id="<%= firstEvent ? "0" : "1"%>" border="0" title="Click To View Details">Requests you have made that are in progress</a>&nbsp;(<%= ticketEventList.getOpenProductTickets().size() %>)
    </td>
  </tr>
</table>
<table border="0" id="productticketsdetails<%= toFullDateString(thisDay.getDate()) %>" style="<%= firstEvent ? "display:" : "display:none"%>">
  <%-- include ticket details --%>
  <%
    Iterator j = ticketEventList.getOpenProductTickets().iterator();
    if(j.hasNext()){
  %>
    <tr>
      <th>
        &nbsp
      </th>
      <th class="weekSelector" nowrap>
        <strong>Request #</strong>
      </th>
      <th class="weekSelector" width="100%">
        <strong>Issue</strong>
      </th>
      <th class="weekSelector" nowrap>
        <strong>Due</strong>
      </th>
    </tr>
  <%  
      while(j.hasNext()){
      Ticket thisTicket = (Ticket) j.next();
      menuCount++;
    %>
    <tr>
     <td>
       <%-- Use the unique id for opening the menu, and toggling the graphics --%>
       <a href="javascript:displayTicketMenu('menuTicket', '<%=  thisTicket.getId() %>', '<%= thisTicket.getContactId() %>');"
       onMouseOver="over(0, <%= menuCount %>)" onmouseout="out(0, <%= menuCount %>)"><img src="images/select.gif" name="select<%= menuCount %>" align="absmiddle" border="0"></a>
     </td>
     <td nowrap>
       <%= thisTicket.getId() %>
     </td>
     <td nowrap>
       <dhv:tz timestamp="<%= thisTicket.getEstimatedResolutionDate() %>" timeOnly="true"/>
     </td>
     <td nowrap>
       <%= StringUtils.trimToSizeNoDots(toString(thisTicket.getProblem()), 30) %>
     </td>
    </tr>
   <% }
   } %>
</table>
</dhv:evaluate>


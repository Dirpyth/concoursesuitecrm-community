<%@ taglib uri="/WEB-INF/dhv-taglib.tld" prefix="dhv" %>
<%@ page import="java.util.*,org.aspcfs.modules.products.base.*,com.zeroio.iteam.base.*" %>
<jsp:useBean id="productDetails" class="org.aspcfs.modules.products.base.ProductCatalog" scope="request"/>
<jsp:useBean id="categoryList" class="org.aspcfs.modules.products.base.ProductCategoryList" scope="request"/>
<%@ include file="../initPage.jsp" %>
<script language="JavaScript">
</script>
<form name="modifyProduct" action="ProductsCatalog.do?command=UpdateProduct&auto-populate=true" onSubmit="return doCheck(this);" method="post">
<%-- Trails --%>
<table class="trails" cellspacing="0">
<tr>
<td>
<a href="ProductsCatalog.do?command=ListAllProducts">Products</a> >
<a href="ProductsCatalog.do?command=ListAllProducts">View Products</a> >
Modify Product
</td>
</tr>
</table>
<table cellpadding="4" cellspacing="0" border="0" width="100%">
  <tr>
    <td>
      <input	type="submit" value="Update" onClick="this.form.dosubmit.value='true';" />
      <%if ("list".equals(request.getParameter("return"))) { %>
        <input type="button" value="Cancel" onClick="window.location.href='ProductsCatalog.do?command=ListAllProducts';this.form.dosubmit.value='false';" />
      <%}else{ %>
        <input type="button" value="Cancel" onClick="window.location.href='ProductsCatalog.do?command=ViewProductDetails&productId=<%=productDetails.getId()%>';this.form.dosubmit.value='false';" />
      <%}%>
      <input	type="reset" value="Reset" />
      <br /> <br />
      <%@ include file="product_include.jsp" %>
      <br />
      <input	type="submit" value="Update" onClick="this.form.dosubmit.value='true';" />
      <%if ("list".equals(request.getParameter("return"))) { %>
        <input type="button" value="Cancel" onClick="window.location.href='ProductsCatalog.do?command=ListAllProducts';this.form.dosubmit.value='false';" />
      <%}else{ %>
        <input type="button" value="Cancel" onClick="window.location.href='ProductsCatalog.do?command=ViewProductDetails&productId=<%=productDetails.getId()%>';this.form.dosubmit.value='false';" />
      <%}%>
      <input	type="reset" value="Reset" />
      <input type="hidden" name="dosubmit" value="true" />
    </td>
  </tr>
</table>
</form>
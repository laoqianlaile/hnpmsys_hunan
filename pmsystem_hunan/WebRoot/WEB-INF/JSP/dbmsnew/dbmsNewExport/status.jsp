<%@ page contentType="text/html;charset=utf-8" %>
<%//@page import="com.gkzx.dbmsnew.driverbean.TaskBean"%>

<HTML>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//TaskBean task = (TaskBean)request.getSession().getAttribute("taskbean");
%>
<HEAD>
    <TITLE>数据导出</TITLE>
    <meta http-equiv="refresh" content="1;url=<%=path %>/getTableInfo.action?operate=daochu">
</HEAD>

<BODY>

	<H2 ALIGN="CENTER">
        完成: 
        <% 
        	double percent =0.0;
        	//if(task!=null){
         	//	percent = task.getPercent(); 
        	//}
        %>
        <%= percent %>%
    </H2>

    <TABLE WIDTH="60%" ALIGN="CENTER"
            BORDER=1 CELLPADDING=0 CELLSPACING=2>
        <TR>
            <% for (int i = 10; i <= percent; i += 10) { %>
                <TD WIDTH="10%" BGCOLOR="#000080">&nbsp;</TD>
            <% } %>
            <% for (int i = 100; i > percent; i -= 10) { %>
                <TD WIDTH="10%">&nbsp;</TD>
            <% } %>
        </TR>
    </TABLE>
    

</BODY>

</HTML>

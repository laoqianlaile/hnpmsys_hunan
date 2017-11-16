<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>刑期变动变动幅度弹出框</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
     <link href="<%=path%>/css/pmisystem.css" rel="stylesheet" type="text/css" />
    <script src="<%=path%>/scripts/boot.js" type="text/javascript"></script>
    

    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden; 
    }
    </style>
</head>
<body>     
    <form id="form1" method="post">
        <div class="mini-toolbar" style="border-bottom:0;padding:1px;height:30px;" >
           <a class="mini-button" onclick="onOk2" plain="true" style="width:60px">确定</a>       
           <a class="mini-button" onclick="onCancel"  plain="true" style="width:60px;">取消</a>  
        </div>
        <div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
            <table style="table-layout:fixed;">
                <tr> 
                     <td width="90px;">    
                          <input id="select2" class="mini-combobox" url="ajaxGetCode.json?codeType=GK059"  showNullItem="true"
							     textField="name" valueField="codeid" allowInput="false" style="width:100%;" showNullItem="true" />
                    </td>
            	</tr>  
            </table>
        </div>
    </form>
    <script type="text/javascript">
        mini.parse();
		var s2 = mini.get("select2");
		var s3 = mini.get("select3");
		var s4 = mini.get("select4");
	    function onOk2(e) {
	    	 var s2value = s2.getValue();
        	 var s2text = s2.text;
        	 var result = "";
        	 if(s2value=='97'){
        	 	result+="终身";
        	 }else{
	        	 if(s2value!=''){
	        	 	result+=s2value+"年"
	        	 }else{
	        		result+=" ";
	        	 }
	        	 
        	 }
        	 //result +=s2text+s3text+s4text;
        	 window.returnValue = result;
             CloseWindow("cancel");
        }
        
         function onCancel(e) {
            CloseWindow("cancel");
        }
        
        function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
       
    </script>
</body>
</html>

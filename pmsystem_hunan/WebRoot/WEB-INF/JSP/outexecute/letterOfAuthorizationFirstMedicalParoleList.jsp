<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>首次保外就医委托函</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="<%=path%>/css/gkzxcss.css" rel="stylesheet" type="text/css" />
	<script src="<%=path%>/scripts/boot.js" type="text/javascript"></script>
	<script src="<%=path%>/scripts/validate.js" type="text/javascript"></script>
	<link href="<%=path%>/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		body {
			margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
		}
	</style>
</head>
<body onload="init('${menuid}');">
	<div class="mini-toolbar" style="padding: 2px; border-bottom: 0px;">
		<jsp:include page="/WEB-INF/JSP/form/buttoncontrol.jsp"></jsp:include>
		<input name="tempid" id="tempid" class="mini-hidden" value="SZXF_SCBWJYWTH"/>
		<table>
			<tr>
				<td style="width: 100%;">
					<a class="mini-button" style="display:none;" id="11862" iconCls="icon-add" plain="true" onclick="add('11862')">新增</a>
				<!--   <a class="mini-button" style="display:none;" id="11863" iconCls="icon-remove" plain="true" onclick="shanchu()">批量删除</a>-->
				<a class="mini-button" iconCls="icon-download" plain="true" style="display:none;" id="12870" onclick="saveNext()">下一个</a>
               	<a class="mini-button" iconCls="icon-close"  plain="true" onclick="onCancel();" >关闭</a>
               	<span style="padding-left:40px;">罪犯编号：${crimid}</span>
        			<span style="padding-left:40px;">姓名：${name}</span>
				</td>
				<td style="white-space: nowrap;">
					<!-- 操作说明 -->
					<a class="mini-button" plain="true" iconCls="icon-help" onclick="chakanshuoming('10179')"></a>
				</td>
			</tr>
		</table>
	</div>
	<div class="mini-fit">
		<div id="datagrid" allowMoveColumn="false" onrowdblclick="rowdblclickfunction" style="width: 100%; height: 100%;" class="mini-datagrid" sizeList="[10,20,50,100]" pageSize="20" 
			url="getLetterOfAuthorizationFirstMedicalParoleList.action?1=1&tempid=SZXF_SCBWJYWTH&crimid=${crimid}" multiSelect="true" showLoading="true" allowResize="false" allowAlternating="true">
			<div property="columns">
<!--				<div type="checkcolumn" width="15px"></div>-->
				<div field="introduction" headerAlign="center" align="left" allowSort="true" width="150px;">文书简介</div>
    		<div field="opid" headerAlign="center"  align="center" allowSort="true" width="30px">操作人</div>
    		<div field="optime" headerAlign="center"  align="center" allowSort="true" renderer="onDateRenderer" width="30px">操作时间</div>
    		<div field="departid" headerAlign="center"  align="center" allowSort="true"width="40px">所属部门</div>
   			<div name="action" headerAlign="center" align="center" renderer="onActionRenderer" width="60px">操作</div> 
			</div>
		</div>
	</div>
	<script type="text/javascript">
         mini.parse();
	     var grid = mini.get("datagrid");
	     grid.load();
	     grid.sortBy("docid", "desc");
	     
	     function onActionRenderer() {
	     	var s = document.getElementById("middlebtns").value;// 资源resid 中间逗号隔开
		    return s;
	     }
	    //新增
	    function add(menuid){
	    	var tempid = mini.get("tempid").getValue();
	    	var crimid = mini.get("crimid").getValue();
	    	mini.open({
	               url: "letterOfAuthorizationFirstMedicalParoleAdd.action?1=1&tempid="+tempid+"&crimid="+crimid+"&menuid="+menuid,
	               showMaxButton: true,
	            	allowResize: false, 
	               title: "首次保外就医委托函", width: 900, height: 500,
	               onload: function () {
	                   var iframe = this.getIFrameEl();
	                   var data = { action:"new"};
	                   iframe.contentWindow.SetData(data);
	               },
	               ondestroy: function (text) {
	                   grid.reload();
	               }
	           });
	    }
       //查看
		function chakan(menuid) {
			var row = grid.getSelected();//获取选中记录
	    	mini.open({
	               url: "letterOfAuthorizationFirstMedicalParoleLook.action?1=1&docid="+row.docid+"&menuid="+menuid,
	               showMaxButton: true,
	            	allowResize: false, 
	               title: "首次保外就医委托函", width: 900, height: 500,
	               onload: function () {
	                   var iframe = this.getIFrameEl();
	                   var data = { action:"show" };
	                   iframe.contentWindow.SetData(data);
	               },
	               ondestroy: function (text){
	                   grid.reload();
	               }
	           });
		}     
		 //修改
		function xiugai(id) {
			var row = grid.getSelected();//获取选中记录
			var crimid = mini.get("crimid").getValue();
	    	mini.open({
	               url: "letterOfAuthorizationFirstMedicalParoleLook.action?1=1&docid="+row.docid+"&crimid="+crimid+"&menuid="+id,
	               showMaxButton: true,
	            	allowResize: false, 
	               title: "首次保外就医委托函", width: 900, height: 500,
	               onload: function () {
	                   var iframe = this.getIFrameEl();
	                   var data = { action:"edit" };
	                   iframe.contentWindow.SetData(data);
	               },
	               ondestroy: function (action){
	                   grid.reload();
	               }
	           });
		}        
		//删除
	       function shanchu(){
	       	var rows = grid.getSelecteds();
	           if (rows.length > 0) {
	               if (confirm("确定删除选中记录？")) {
	                   var ids = [];
	                   for (var i = 0, l = rows.length; i < l; i++) {
	                       var r = rows[i];
	                       ids.push(r.docid);
	                   }
	                   var id = ids.join(',');
	                   grid.loading("操作中，请稍后......");
	                   $.ajax({
	                       url: "deleteLetterOfAuthorizationFirstMedicalParole.action?1=1&docid="+id,
	                       type: "post",
	                       success: function (text) {
	                           grid.reload();
	                       },
	                       error: function () {
	                       alert("操作失败!");
	                       }
	                   });
	               }
	           } else {
	               alert("请选中一条记录");
	           }
		}
		 function saveNext (){
	    	var id = mini.get("id").getValue();
	        var index = id.indexOf(",");
	        id = id.substring(index+1,id.length);
	        var idname = '${idname}';
	        var indexname = idname.indexOf(",");
	        idname = idname.substring(indexname+1,idname.length);
	        var url= "letterOfAuthorizationFirstMedicalParoleList.action?1=1&id="+id+"&menuid=${menuid}&idname="+idname;
	        if(index>0){
	            self.location.href=url;
	        }else{
	        	//alert("批量处理已完成！");
	        	onCancel();
	        }
	    }
		//返回到罪犯处理页面
       function onCancel(){  
          url = "letterOfAuthorizationFirstMedicalParole.action?1=1&menuid=10293";
          self.location.href=url;          
       }
   </script>
</body>
</html>
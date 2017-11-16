<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.gkzx.common.GkzxCommon"%>
<%
String path = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>保外就医罪犯收监执行审查表</title>
    <script src="<%=path%>/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
 	<script src="<%=path%>/scripts/boot.js" type="text/javascript"></script>
    <style type="text/css">
		body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }   
	</style>
</head>
<body onload="init('${menuid }')">
	<div  id="form1" class="mini-splitter"  vertical="true" style="width:100%;height:100%;border:0px;">
	<div size="38px;" showCollapseButton="false">
		<div class="mini-toolbar" style="height:30px;">
		<table>
		<tr>
		<td style="width:100%;">
	    	<a class="mini-button"  style="display:none;" id="12456" iconCls="icon-gk_fullscream" tooltip="全屏模式" plain="true" onclick="doMenueButton(4);"></a>&nbsp;
			<a class="mini-button"  style="display:none;" id="12455" iconCls="icon-gk_page" tooltip="阅读模式" plain="true" onclick="doMenueButton(3);"></a>&nbsp;
			<span class="separator"></span> 
			<a class="mini-button" style="display:none;" id="12190" iconCls="icon-save" plain="true" onclick="doSubmitFlow('12190','save','doc_bwjyzfsjzx','TJBWJY');">存盘</a>
			<a class="mini-button" style="display:none;" id="12191" iconCls="icon-downgrade" plain="true" onclick="doSubmitFlow('12191','yes','doc_bwjyzfsjzx','TJBWJY');">提交</a>
<!--	监狱意见		-->
			<a class="mini-button" style="display:none;" id="12193" iconCls="icon-downgrade" plain="true" onclick="operationOpprove('12193','yes','jianyuyijian_data0');">同意</a>
			<a class="mini-button" style="display:none;" id="12194" iconCls="icon-upgrade" plain="true" onclick="operationOpprove('12194','no','jianyuyijian_data0');">拒绝</a>
<!--	刑法处意见	-->
			<a class="mini-button" style="display:none;" id="12201" iconCls="icon-downgrade" plain="true" onclick="operationOpprove('12201','yes','xingfachuyijian_data1');">同意</a>
			<a class="mini-button" style="display:none;" id="12205" iconCls="icon-upgrade" plain="true" onclick="operationOpprove('12205','no','xingfachuyijian_data1');">拒绝</a>
			<a class="mini-button" style="display:none;" id="12202" iconCls="icon-back" plain="true" onclick="doApproveFlow('12202','back','doc_bwjyzfsjzx','TJBWJY');">退回</a>
<!--	局长意见		-->
			<a class="mini-button" style="display:none;" id="12203" iconCls="icon-downgrade" plain="true" onclick="operationOpprove('12203','yes','shengjuyijian_data2');">同意</a>
			<a class="mini-button" style="display:none;" id="12206" iconCls="icon-upgrade" plain="true" onclick="operationOpprove('12206','no','shengjuyijian_data2');">拒绝</a>
			<a class="mini-button" style="display:none;" id="12204" iconCls="icon-back" plain="true" onclick="doApproveFlow('12204','back','doc_bwjyzfsjzx','TJBWJY');">退回</a>
			
			<a class="mini-button" style="display:none;" id="12195" iconCls="icon-download" plain="true" onclick="saveNext();">下一个</a>
			<a class="mini-button" iconCls="icon-close" plain="true" onclick="close()">关闭</a>
	    	<span class="separator"></span> 
	    	<a class="mini-button"  style="display:none;" id="12458" iconCls="icon-gk_gz" tooltip="签名（章）" plain="true" onclick="doMenueButton(5);"></a>&nbsp;
	    	<a class="mini-button"  style="display:none;" id="12459" iconCls="icon-gk_qfz" tooltip="骑缝章" plain="true" onclick="doMenueButton(13);"></a>&nbsp;
	    	<a class="mini-button"  style="display:none;" id="12460" iconCls="icon-gk_cx" tooltip="撤销签名" plain="true" onclick="doMenueButton(10);"></a>&nbsp;
	    	<span class="separator"></span> 
	    	<a class="mini-button"  style="display:none;" id="12465" iconCls="icon-gk_bjsj"  tooltip="笔迹设置" plain="true" onclick="doMenueButton(12)"></a>&nbsp;
	    	<a class="mini-button"  style="display:none;" id="12461" iconCls="icon-gk_sxqm"  tooltip="手写签批" plain="true" onclick="doMenueButton(6);"></a>&nbsp;
	    	<a class="mini-button"  style="display:none;" id="12462" iconCls="icon-gk_xpc" plain="true" tooltip="擦除手写签批" onclick="doMenueButton(7);"></a>&nbsp;
	    	<span class="separator"></span> 
	    	<a class="mini-button"  style="display:none;" id="12463" iconCls="icon-gk_zw" tooltip="按指纹" plain="true" onclick="doMenueButton(8);"></a>&nbsp;
	    	<span class="separator"></span> 
	    	<a class="mini-button"  style="display:none;" id="12464" iconCls="icon-gk_print" tooltip="文档打印" plain="true" onclick="doMenueButton(9);"></a>&nbsp;
	    	<a class="mini-button"  style="display:none;" id="12466" iconCls="icon-gk_open" tooltip="加载文档" plain="true"  onclick="doMenueButton(0);"></a>&nbsp;
	    	<a class="mini-button"  style="display:none;" id="12467" iconCls="icon-gk_save" tooltip="另存为..." plain="true"  onclick="doMenueButton(1);"></a>&nbsp;
	    </td>
	    <td style="white-space:nowrap;">
	    	<a class="mini-button"   style="display:none;" id="1111" iconCls="icon-gk_help" tooltip="帮助" plain="true"  onclick=""></a>&nbsp;
	    </td>
	  	</tr>
	  	</table>
	  	</div>
  	</div>
	<div showCollapseButton="false">
	  	<jsp:include page="/WEB-INF/JSP/form/buttoncontrol.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/JSP/form/include_form.jsp"></jsp:include>
  	</div>
  </div>
    <script type="text/javascript">
        mini.parse();
        var grid = mini.get("datagrid1");
        function saveNext (){
        	var id = mini.get("id").getValue();
            var index = id.indexOf(",");
            id = id.substring(index+1,id.length);
            var url= "showBaowaijiuyi.action?1=1&id="+id+"&menuid="+${menuid};
            if(index>0){
                self.location.href=url;
            }else{
            	close();
            }
        }
        
        //手动关闭
        function close(){
        	 var url="BaowaijiuyiChoose.action?1=1";
        	 self.location.href=url;
        }
          
    </script>
</body>
</html>

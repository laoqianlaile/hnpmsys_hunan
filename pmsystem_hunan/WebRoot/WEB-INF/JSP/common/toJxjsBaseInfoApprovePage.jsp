<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.sinog2c.model.system.SystemResource"%>
<%@page import="com.sinog2c.util.common.StringNumberUtil"%>
<%
	String path = request.getContextPath();
	
	SystemResource grid1 = null;
	List<SystemResource> grid1ColList = new ArrayList<SystemResource>();
	String flowdefid = "";
	//
	Object grid1_attr = request.getAttribute("grid1");
	Object grid1ColList_attr = request.getAttribute("grid1ColList");
	//
	if(grid1_attr instanceof SystemResource){
		grid1 = (SystemResource)grid1_attr;
	}
	if(grid1ColList_attr instanceof List<?>){
		grid1ColList = (List<SystemResource>)grid1ColList_attr;
	}
	//
	Object flowdefidObj = request.getAttribute("flowdefid");
	if(null != flowdefidObj){
		flowdefid = flowdefidObj.toString();
	}
	//
	String topsearch = "";
	Object topsearchObj = request.getAttribute("topsearch");
	if(null != topsearchObj){
		topsearch = topsearchObj.toString();
	}
	
	String middlestr = "";
	Object middlestrObj = request.getAttribute("middlestr");
	if(null != middlestrObj){
		middlestr = middlestrObj.toString();
	}
	
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="<%=path%>/css/gkzxcss.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/css/pmisystem.css" rel="stylesheet" type="text/css" />
    <script src="<%=path%>/scripts/boot.js" type="text/javascript"></script> 
    <link href="<%=path%>/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" /> 
   
    <style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }    
    </style>
</head>
<body>
    <div>
        <div class="mini-toolbar" style="border-bottom:0px;padding:0px;">
        	<input id="tempid" name="tempid" class="mini-hidden" value="${tempid}"/>
			<input id="flowdefid" name="flowdefid" class="mini-hidden" value="${flowdefid}"/>
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                    	${topstr}
                    </td>
                    <td style="white-space:nowrap;">
                    	${topsearch}
	                	<%
	                		if(StringNumberUtil.notEmpty(topsearch)){
	                	%>
	                			<a class="mini-button" iconCls="icon-search"  plain="true" onclick="search();">查询</a>
	                	<%
	                		}
	                	%>
	                	<!-- 操作说明 -->
		                <a class="mini-button" plain="true" iconCls="icon-help" onclick="chakanshuoming('${menuid}')"></a> 
                    </td>
                </tr>
            </table>       
        </div>
    </div>
         

    <div class="mini-fit" id="div_two">
    	<%--
        	// 根据配置的Grid以及列进行拼接
         --%>
         <%
         if(null != grid1){
        	 //
        	 String tempid = grid1.getFormid(); //表单ID;
        	 String solutionid = grid1.getQuerysql(); //查询方案ID
        	 String url = "";
        	 //
			 StringBuffer urlSb = new StringBuffer();
        	 if(StringNumberUtil.isEmpty(grid1.getSrurl())){
        	 	urlSb.append(path).append("/getPublicListData.json?1=1");
        	 }else{
        	 	urlSb.append(path).append("/").append(grid1.getSrurl());
        	 }
        	 
        	 //从菜单的参数中获取参数，但是如果Grid中有相应参数，则以Grid为准
			 Object paramMapObject = request.getAttribute("paramMap");
			 if(null != paramMapObject && paramMapObject instanceof HashMap){
				 Map paramMap = (HashMap)paramMapObject;
				 if(StringNumberUtil.notEmpty(tempid)&&paramMap.containsKey("tempid")){
				 	paramMap.remove("tempid");
				 }
				 if(StringNumberUtil.notEmpty(solutionid)&&paramMap.containsKey("solutionid")){
				 	paramMap.remove("solutionid");
				 }
				 if(urlSb.indexOf("?") == -1){
				 	urlSb.append("?1=1");
	        	 }
	        	 
				 Set<String> set = paramMap.keySet();
				 for(String key : set){
					 Object valueObj = paramMap.get(key);
					 if(StringNumberUtil.notEmpty(valueObj)){
						 String value = valueObj.toString();
						 urlSb.append("&").append(key).append("=").append(value);
					 }
				 }
			 }
        	 
        	 //
        	 if(StringNumberUtil.notEmpty(tempid) && urlSb.indexOf("tempid")==-1){
        	 	urlSb.append("&tempid=").append(tempid);
        	 }
        	 if(StringNumberUtil.notEmpty(solutionid) && urlSb.indexOf("solutionid")==-1){
        	 	urlSb.append("&solutionid=").append(solutionid);
        	 }
        	 if(StringNumberUtil.notEmpty(flowdefid) && urlSb.indexOf("flowdefid") == -1){
        	 	urlSb.append("&flowdefid=").append(flowdefid);
        	 }
        	 url = urlSb.toString();
         %>
         <div id="form1"  class="mini-splitter" vertical="true" style="display: none;" >
	     
	    </div>
	    <div id="datagrid1" allowMoveColumn="false" allowCellEdit="true" style="width:100%;height:100%;" class="mini-datagrid"   
	        url="<%=url%>"  idField="" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"  
	        onshowrowdetail="onShowRowDetail" allowAlternating="true"  sizeList="[10,20,50,100]" pageSize="20">
	        <div property="columns">
	        	<div type="checkcolumn" width="15"></div>
	        	<div type="indexcolumn" width="15">序号</div>
	        	<%
			    	 //
			    	 Iterator<SystemResource> iteratorC = grid1ColList.iterator();
			    	 while(iteratorC.hasNext()){
			    		 SystemResource col = iteratorC.next();
			    		 //
			    		 String name = col.getName();
			    		 String field = col.getShowsite();
			    		 Integer width = col.getWindowwidth();
			    		 String renderer = col.getSrurl();
			    		 String additionInfo = col.getText1();
			    		 //
			    		 
			    		 //
			    		 if(StringNumberUtil.isEmpty(field)){
			    			 continue;
			    		 } else {
			    			 field = field.trim().toLowerCase();
			    		 }
			    		 if(StringNumberUtil.isEmpty(name)){
			    			 name = "";
			    		 }
			    		 if(null == width || width.intValue() < 1){
			    			 width = 30;
			    		 }
		
			    		 String rendererStr = "";
			    		 if(!StringNumberUtil.isEmpty(renderer)){
			    			 rendererStr = " renderer=\"" + renderer +"\" ";
			    		 }
			    		 
			    		 String allowSort = "";
			    		 if(StringNumberUtil.isEmpty(additionInfo)){
			    			 additionInfo = " allowSort=true ";
			    		 }else if(additionInfo.indexOf("allowSort")< 0){
			    			 additionInfo += " allowSort=true ";
			    		 }
			    		 // 列
		         %>
		              <div field="<%=field %>" width="<%=width %>" headerAlign="center" align="center" <%=additionInfo %> <%=rendererStr %> ><%=name %></div>    
		         <%
		         	}
		         %>
	            <%
		         	if(StringNumberUtil.notEmpty(middlestr)){	
		         %>
		              <div name="action" width="60" headerAlign="center" align="center"  allowSort="false" renderer="onActionRenderer">操作</div>  
		         <%
		         	}
		         %>
		          </div> <!-- end of columns -->
		        </div> <!-- end of mini-datagrid -->
		         <%
		         }
		         %>
	    
	</div> <!-- end of detailGrid_Form -->
	
  </div>  <!-- end of div_two -->
    <script type="text/javascript">
       	mini.parse();
        var grid = mini.get("datagrid1");
        grid.load();
        
        //grid.sortBy("text6", "asc");
        
      var path = '<%=path%>';
        
      function onActionRenderer(e) {
    	  	var record = e.record;
    	  	var s = "";
    	  	if(record.basestatus=='0'){
    	  		s +="<a class='Edit_Button' href='javascript:submitBaseInfo()'>基本信息</a>&nbsp;&nbsp;";
    	  	}
    	  	
    	  	if(record.sentencestatus){
	    		if(parseInt(record.sentencestatus) > 0){
	    			s +="<a class='Edit_Button' href='javascript:submitSentence()'>刑罚变动</a>&nbsp;&nbsp;";
	    		}
	    	}
    	  	
    	  	if(parseInt(record.caichanstatus) > 0){
    	  		s +="<a class='Edit_Button' href='javascript:submitProperty()'>财产刑</a>&nbsp;&nbsp;";
    		}
        	//var s = '${middlestr}';
	     	return s;
        }
      
        function search(){
        	var topsearchkey = '${topsearchkey}';
        	if(topsearchkey){
        		var topsearchkeyArr = topsearchkey.split(',');
        	}
        	var data = {};
        	for(var i=0,l=topsearchkeyArr.length; i<l ; i++){
        		var key = topsearchkeyArr[i]
        		 var value = mini.get(key).getValue();
        		 if(value){
        			 data[key] =encodeURI( value );
            	 }
        	}
            grid.load(data);
        };
        
        function onKeyEnter(e) {
            search();
        };
        
        function onValueChanged(e) {
            search();
        };
        
         // 刷新本页面
		function refreshPage(){
			location.reload();
		};
		
        var confirmMessages = "请至少选中一条记录！";
		var batchAlertOne = "确定对下列人员进行立案吗？"
		
		function onBaseInfoSubmitRenderer(e){
			var record = e.record;
	    	if(record.basestatus=='0'){
	    		return "未审核";
	    	}
	        return "";
	    }
		
		function onSentenceSubmitRenderer(e){
			var record = e.record;
	    	if(record.sentencestatus){
	    		if(parseInt(record.sentencestatus) > 0){
	    			return "未审核";
	    		}
	    	}
	        return "";
	    }
		
		function onPropertySubmitRenderer(e){
			var record = e.record;
			if(parseInt(record.caichanstatus) > 0){
    			return "未通过";
    		}
	        return "";
	    }
    </script>
    <script src="<%=path%>/scripts/publicjs.js" type="text/javascript"></script>
</body>
</html>
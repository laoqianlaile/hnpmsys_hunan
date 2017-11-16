<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>新增或修改(减刑假释呈批表宁夏)</title>
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
<body>
     <div id="datagrid1" class="mini-datagrid" style="width:700px;height:280px;" allowResize="true"
        url="../data/AjaxService.aspx?method=SearchEmployees"  idField="id"
        
    >
        <div property="columns">
            <div name="action" width="120" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">#</div>
            <div field="loginname" width="120" headerAlign="center" allowSort="true">员工帐号</div>                
            <div field="gender" width="100" allowSort="true" renderer="onGenderRenderer" align="center" headerAlign="center">性别</div>            
            <div field="age" width="100" allowSort="true">年龄</div>
            <div field="birthday" width="100" allowSort="true" dateFormat="yyyy-MM-dd">出生日期</div>                                    
            <div field="createtime" width="100" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">创建日期</div>                
        </div>
    </div>    
    
<div id="editForm1" style="display:none;padding:5px;position:relative;">
    <input class="mini-hidden" name="id"/>
    <table style="width:100%;">
        <tr>
            <td style="width:80px;">员工帐号：</td>
            <td style="width:150px;"><input name="loginname" class="mini-textbox" /></td>
            <td style="width:80px;">姓名：</td>
            <td style="width:150px;"><input name="name" class="mini-textbox" /></td>
            <td style="width:80px;">薪资：</td>
            <td style="width:150px;"><input name="salary" class="mini-textbox" /></td>
        </tr>
        <tr>
            <td>性别：</td>
            <td><input name="gender" class="mini-combobox" data="Genders"/></td>
            <td>年龄：</td>
            <td><input name="age" class="mini-spinner" minValue="0" maxValue="200" value="25"  /></td>
            <td>出生日期：</td>
            <td><input name="birthday" class="mini-datepicker" /></td>
        </tr>
        <tr>
            <td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="6">
                <a class="Update_Button" href="javascript:updateRow();">Update</a> 
                <a class="Cancel_Button" href="javascript:cancelRow();">Cancel</a>
            </td>                
        </tr>
    </table>
</div>


    <script type="text/javascript">
        var Genders = [{ id: 1, text: '男' }, { id: 2, text: '女'}];

        mini.parse();
        
        var editForm = document.getElementById("editForm1");        
        
        var grid = mini.get("datagrid1");
        grid.load();
        grid.sortBy("createtime", "desc");
        
        ///////////////////////////////////////////////////////       
        
        function onGenderRenderer(e) {
            for (var i = 0, l = Genders.length; i < l; i++) {
                var g = Genders[i];
                if (g.id == e.value) return g.text;
            }
            return "";
        }

        function onActionRenderer(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
            var rowIndex = e.rowIndex;

            var s = '<a class="New_Button" href="javascript:newRow()">New</a> '
                    + '<a class="Edit_Button" href="javascript:editRow(\'' + uid + '\')">Edit</a> '
                    + '<a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">Delete</a> ';
                       
            return s;
        }

        function newRow() {            
            var row = {};
            grid.addRow(row, 0);

            editRow(row._uid);
        }
        function editRow(row_uid) {
            var row = grid.getRowByUID(row_uid);
            if (row) {
                //显示行详细
                grid.hideAllRowDetail();
                grid.showRowDetail(row);

                //将editForm元素，加入行详细单元格内
                var td = grid.getRowDetailCellEl(row);
                td.appendChild(editForm);
                editForm.style.display = "";

                //表单加载员工信息
                var form = new mini.Form("editForm1");
                if (grid.isNewRow(row)) {                    
                    form.reset();
                } else {
                    form.loading();
                    $.ajax({
                        url: "../data/AjaxService.aspx?method=GetEmployee&id=" + row.id,
                        success: function (text) {
                            var o = mini.decode(text);
                            form.setData(o);                            

                            form.unmask();
                        }
                    });
                }

                grid.doLayout();
        
            }
        }
        function cancelRow() {
            grid.reload();
        }
        function delRow(row_uid) {
            var row = grid.getRowByUID(row_uid);
            if (row) {
                if (confirm("确定删除此记录？")) {
                    grid.loading("删除中，请稍后......");
                    $.ajax({
                        url: "../data/AjaxService.aspx?method=RemoveEmployees&id=" + row.id,
                        success: function (text) {
                            grid.reload();
                        },
                        error: function () {
                        }
                    });
                }
            }
        }

        function updateRow() {
            var form = new mini.Form("editForm1");

            var o = form.getData();
            
            grid.loading("保存中，请稍后......");
            var json = mini.encode([o]);
            
            $.ajax({
                url: "../data/AjaxService.aspx?method=SaveEmployees",
                data: { data: json },
                success: function (text) {
                    grid.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });

        }
    </script>

    <div class="description">
        <h3>Description</h3>
        
    </div>
</body>
</html>
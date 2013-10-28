<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Launcher.aspx.cs" Inherits="Launcher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
	<telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		<Scripts>
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
		</Scripts>
	</telerik:RadScriptManager>
	<script type="text/javascript">
	    //Put your JavaScript code here.
	    function Launch() {
	        window.open("http://localhost:54456//Default.aspx", null, "width=500,height=500");
	    }
    </script>
	<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
	</telerik:RadAjaxManager>
	<div>
        <telerik:RadButton ID="RadButton1" runat="server" Text="RadButton" OnClientClicked="Launch()"></telerik:RadButton>
	</div>
	</form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
        <link href="css/ace.min.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
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
                function doNothing() {
                }
                function alertClose() {
                    window.close();
                }
            </script>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            </telerik:RadAjaxManager>
            <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Metro"></telerik:RadSkinManager>
            <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
            <div class="container-fluid">
                <div id="TitleZone" class="row-fluid table-header">
                    <asp:Label ID="lblTitle" runat="server" Text="Cargar ficheros"></asp:Label>
                </div>
                <div class="row-fluid">
                    <table id="TLoader">
                        <tr>
                            <td>
                                <div class="span12">
                                    <asp:Label ID="lblAddtionalInformation" runat="server" Text="Información adicional:"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="span12">
                                    <telerik:RadUpload ID="rdUploader" runat="server" MaxFileInputsCount="1" ControlObjectsVisibility="None" InputSize="100" CssClass="span12">
                                        <Localization Select="Seleccionar..." />
                                    </telerik:RadUpload>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="span12" style="text-align:right;">
                                    <telerik:RadButton ID="btnLoader" runat="server" Text="Cargar Fichero" OnClick="btnLoader_Click"></telerik:RadButton>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="span12">
                                    <telerik:RadProgressManager ID="RadProgressManager1" runat="server" />
                                    <telerik:RadProgressArea ID="RadProgressArea1" runat="server" Width="400px"></telerik:RadProgressArea>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </form>
    </body>
</html>

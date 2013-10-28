﻿using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.IO;

public partial class Default : System.Web.UI.Page
{
    #region Variable definition
    // these variables go inside URL
    string returnUrl = "";
    string application = "";
    string userId = "";
    string formId = "";
    string fieldId = "";
    string message = "";
    // other parameters
    string repository = "";
    #endregion
    protected void Page_Init(object sender, EventArgs e)
    {
        //// read url parameters 
        //if (Request.QueryString["ReturnUrl"] != null)
        //{
        //    returnUrl = Request.QueryString["ReturnUrl"];
        //}
        //else needParamUrlMessage("ReturnUrl");
        ////
        //if (Request.QueryString["Application"] != null)
        //{
        //    application = Request.QueryString["Appiclation"];
        //}
        //else needParamUrlMessage("Application");
        ////
        //if (Request.QueryString["UserId"] != null)
        //{
        //    userId = Request.QueryString["UserId"];
        //}
        //else needParamUrlMessage("UserId");
        ////
        //if (Request.QueryString["FormId"] != null)
        //{
        //    formId = Request.QueryString["FormId"];
        //}
        //else needParamUrlMessage("UserId");
        ////
        //if (Request.QueryString["FieldId"] != null)
        //{
        //    fieldId = Request.QueryString["FieldId"];
        //}
        //else needParamUrlMessage("FieldId");
        //

        // only for test purposes
        returnUrl = "http://www.google.com";
        application = "PortalPro";
        userId = "U001";
        formId = "Facturas";
        fieldId = "PDF";

        if (Request.QueryString["Message"] != null)
        {
            message = Request.QueryString["Message"];
        }
        else 
        {
            message = "Seleccione el fichero con el botón \"Seleccionar\". Haga clic en \"Cargar fichero\" para proceder a la carga del  mismo";
        }
        lblAddtionalInformation.Text = message;
        string path = "";
        // verifying if there is a repository parameter
        repository = ConfigurationManager.AppSettings["Repository"];
        path = Path.Combine(repository);
        // and if its phisical folder exists
        if (!Directory.Exists(path))
            RadWindowManager1.RadAlert(String.Format("El repositorio {0} no existe", repository),null, null,"Aviso","alertClose");
        // application folder control
        path = Path.Combine(path, String.Format("{0}\\{1}",path,application));
        if (!Directory.Exists(path))
        {
            // create folder
            Directory.CreateDirectory(path);
        }
        // user folder inside application
        path = Path.Combine(path, String.Format("{0}\\{1}", path, userId));
        if (!Directory.Exists(path))
        {
            // create folder
            Directory.CreateDirectory(path);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLoader_Click(object sender, EventArgs e)
    {
        // when file have been loaded this event fires
        int nf = rdUploader.UploadedFiles.Count;
        if (nf == 0)
        {
            RadWindowManager1.RadAlert("Debe escoger un fichero", null, null, "Aviso", "doNothing");
            return;
        }
        UploadedFile f = rdUploader.UploadedFiles[0];
        string name = f.GetName();
        string myDirectory = Path.Combine(repository, application, userId);
        string startFileName = String.Format("{0}#{1}#", formId, fieldId);
        // delete previous files for the same field
        foreach (FileInfo fl in new DirectoryInfo(myDirectory).GetFiles(String.Format("{0}*",startFileName)))
        {
            fl.Delete();
        }
        string myFileName = Path.Combine(myDirectory, String.Format("{0}{1}",startFileName, name));
        f.SaveAs(myFileName);
        // now we save a local copy accesible by an url reference
        string path2 = this.MapPath("/uploads");
        string startFileName2 = String.Format("{0}-{1}-{2}-{3}", application, userId, formId, fieldId);
        // delete previous files
        foreach (FileInfo fl2 in new DirectoryInfo(path2).GetFiles(String.Format("{0}*", startFileName2)))
        {
            fl2.Delete();
        }
        string myFileName2 = Path.Combine(path2, String.Format("{0}-{1}", startFileName2, name));
        f.SaveAs(myFileName2);
        RadWindowManager1.RadAlert(String.Format("El fichero {0} se ha cargado correctamente", name), null, null, "Aviso", "alertClose");
    }
    protected void needParamUrlMessage(string m)
    {
        m = string.Format("Falta el parámetro {0} en la llamada a la carga", m);
        RadWindowManager1.RadAlert(m, null, null, "Atención", "alertClose");
    }
}

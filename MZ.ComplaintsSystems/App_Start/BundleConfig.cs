using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace MZ.ComplaintsSystems
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkID=303951
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new StyleBundle("~/bundles/css").Include(
                           "~/vendor/metisMenu/metisMenu.min.css",
                            "~/dist/css/sb-admin-2.css",
                            "~/vendor/morrisjs/morris.css",
                            "~/Content/bootstrap-theme-rtl.min.css",
                            "~/Content/bootstrap-theme-rtl.css",
                            "~/Content/jquery.raty.css",
                            "~/Content/bootstrap-rtl.min.css",
                            "~/Content/bootstrap-datetimepicker.css",
                            "~/Content/bootstrap-rtl.css",
                             "~/vendor/font-awesome/css/font-awesome.min.css"));

            bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
                            "~/Scripts/WebForms/WebForms.js",
                            "~/Scripts/WebForms/WebUIValidation.js",
                            "~/Scripts/WebForms/MenuStandards.js",
                            "~/Scripts/WebForms/Focus.js",
                            "~/Scripts/WebForms/GridView.js",
                            "~/Scripts/WebForms/DetailsView.js",
                            "~/Scripts/WebForms/TreeView.js",
                            "~/Scripts/WebForms/WebParts.js"));

            // Order is very important for these files to work, they have explicit dependencies
            bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include(
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

            bundles.Add(new ScriptBundle("~/bundles/Scripts").Include(
                    "~/Scripts/jquery-2.2.4.min.js",
                     //"~/Scripts/moment.min.js",
                     //"~/Scripts/moment-with-locales.min.js",
                     "~/Scripts/moment-with-locales.js",
                     "~/Scripts/bootstrap-datetimepicker.min.js",
                    "~/Scripts/jquery.raty.js",
                    "~/Scripts/bootstrap-rtl.js",
                    "~/vendor/raphael/raphael.min.js",
                    "~/vendor/metisMenu/metisMenu.min.js",
                    "~/dist/js/sb-admin-2.js"
                    //"~/Scripts/ar_MA.js",
                    //"~/data/morris-data.js",
                    //"~/vendor/morrisjs/morris.min.js"
                    ));

            // Use the Development version of Modernizr to develop with and learn from. Then, when you’re
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                            "~/Scripts/modernizr-*"));

            ScriptManager.ScriptResourceMapping.AddDefinition(
                "respond",
                new ScriptResourceDefinition
                {
                    Path = "~/Scripts/respond.min.js",
                    DebugPath = "~/Scripts/respond.js",
                });
        }
    }
}
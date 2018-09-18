using MZ.ComplaintsSystems.Models;
using MZ.DB_Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity.Core.Objects;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using log4net;
using System.Configuration;

namespace MZ.ComplaintsSystems.Util
{
    public static class Utilities
    {
        static readonly string sUserID = ConfigurationManager.AppSettings["SMSGateWayUserName"];
        static readonly string sPwd = ConfigurationManager.AppSettings["SMSGateWayPassword"];
        static readonly string sSID = ConfigurationManager.AppSettings["SMSGateWaySenderId"];
        static readonly string smsGatwayUrl = ConfigurationManager.AppSettings["SMSGateWayUrl"];

        public static async Task<bool> SendSMS(string mobileNumber, string message, decimal notificationID)
        {
            bool smsGatewayEnabled = Convert.ToBoolean(ConfigurationManager.AppSettings["SMSGateWayEnabled"]);
            if (smsGatewayEnabled)
            {
                if (mobileNumber.Length != 12)
                {
                    Log.Error("رقم الجوال المدخل غير صحيح");
                    throw new Exception("رقم الجوال المدخل غير صحيح");
                    
                }
                await Task.Run(() =>
                {
                    string sURL = smsGatwayUrl + "?user=" + sUserID + "&" +
                 "password=" + sPwd + "&msisdn=" + "{0}" + "&sid=" + sSID + "&msg=" + "{1}" + "&fl=0";
                    sURL = string.Format(sURL, mobileNumber, message);
                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(sURL);
                    request.MaximumAutomaticRedirections = 4;
                    request.Credentials = CredentialCache.DefaultCredentials;
                    HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                    Stream receiveStream = response.GetResponseStream();
                    StreamReader readStream = new StreamReader(receiveStream, Encoding.UTF8);
                    string sResponse = readStream.ReadToEnd();
                    NotificationModel notificationModel = JsonConvert.DeserializeObject<NotificationModel>(sResponse);
                    int status = notificationModel.ErrorCode == "000" ? 2 : 3;
                    if (status != 2)
                        Log.Error("Error Sending SMS to:" + mobileNumber + " - " + notificationModel.ErrorCode + " - " + notificationModel.ErrorMessage);
                    using (Entities1 db = new Entities1())
                    {
                        ObjectResult<usp_NotificationsMessagesUpdate_Result> result = db.usp_NotificationsMessagesUpdate(notificationID, status, notificationModel.ErrorMessage, 1, DateTime.Now);
                    }
                    response.Close();
                    readStream.Close();
                });
                return true;
            }
            else
                return false;

        }

        public static string GetDescription(System.Enum input)
        {
            Type type = input.GetType();
            MemberInfo[] memInfo = type.GetMember(input.ToString());

            if (memInfo != null && memInfo.Length > 0)
            {
                object[] attrs = (object[])memInfo[0].GetCustomAttributes(typeof(DescriptionAttribute), false);
                if (attrs != null && attrs.Length > 0)
                {
                    return ((DescriptionAttribute)attrs[0]).Description;
                }
            }
            return input.ToString();
        }
    }
}
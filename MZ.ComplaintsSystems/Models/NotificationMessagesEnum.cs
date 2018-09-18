using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace MZ.ComplaintsSystems.Models
{
    public enum NotificationMessagesEnum
    {
        [Description("عزيزي صاحب الشقة نفيدكم بوجود بلاغ رقم {0} بتاريخ {1} ونأمل منكم التعاون مع الفني المختص لأنهائه.")]
        ComplaintCreationSMS = 1,
        [Description("عزيزي صاحب الشقة نفيدكم بان البلاغ رقم {0}  تم الأنتهاء منه ونشكركم علي تعاونكم معنا. يمكنك تقيم مستوي الخدمة عبر الرابط التالي {1}")]
        ComplaintClosure = 2
    }
}
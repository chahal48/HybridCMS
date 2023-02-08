using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace HybridCMS.Models
{
    public class MailHelper
    {
        public static bool ForgetPasswordEmail(string to,string subject,string body,bool IsBodyHtml)
        {
            string from = "sachin.chahal48@gmail.com";
            string display = "HybridCMS";
            string password = "dexckbuqnnhsthes";

            var fromEmail = new MailAddress(from,display);
            var toEmail = new MailAddress(to);
            var smtp = new SmtpClient
            {
                Host= "smtp.gmail.com",
                Port= 587,
                EnableSsl= true,
                Timeout= 5000,
                DeliveryMethod= SmtpDeliveryMethod.Network,
                UseDefaultCredentials= false,
                Credentials=new NetworkCredential(fromEmail.Address,password)
            };
            var message = new MailMessage(fromEmail, toEmail)
            {
                Subject= subject,
                Body= body,
                IsBodyHtml= IsBodyHtml
            };

            try
            {
                smtp.Send(message);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
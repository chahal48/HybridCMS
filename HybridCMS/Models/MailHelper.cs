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

        public void ResetPasswordMail()
        {
            StringBuilder forgetPasswordUrl = new StringBuilder();
            //forgetPasswordUrl = forgetPasswordUrl.Append(Request.Url.GetLeftPart(UriPartial.Authority));
            forgetPasswordUrl = forgetPasswordUrl.Append("/url=hfabfjdasndnxnasnnx32yhdbd632bdb363");
            string subject = "Welcome to my web application";
            string body = "<h1 style=\"color: #3CB815 !important; font-weight: 700 !important;margin: 0 !important;font-size: calc(1.375rem + 1.5vw);\">Hybrid<span style=\"color: #F65005 !important;\">CMS</span></h1>" +
                                "Please use the following link to reset your password:" +
                                "<br/><br/><a href=\"" + forgetPasswordUrl + "\" style=\"cursor: pointer;font-size: 0.9rem;padding: 0.50rem 1rem;letter-spacing: 0.05rem;text-decoration: none !important;border-radius: 20px;font-weight: 700 !important;color: #fff;background-color: #3CB815;border-color: #3CB815;display: inline-block;\">Reset</a>" +
                                "<br/><br/>Please note that the link will expire in 15 minutes." +
                                //link to reset password
                                "<br/>If you did not request a password change, please feel free to ignore this message." +
                                "<br/>If you have any comments or questions don’t hesitate to reach us at <b>" +
                                "sachin.c@antheminfotech.com" + //email address
                                "</b>" +
                                "<br/>please feel free to respond to this email.It was sent from a monitored email address, and we would love to hear from you.";
            //MailHelper.ForgetPasswordEmail(obj.EmailorUsername, subject, body, true);
        }
    }
}
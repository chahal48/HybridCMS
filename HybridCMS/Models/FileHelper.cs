using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace HybridCMS.Models
{
    public class FileHelper
    {
        public void DeleteFile(string FileName)
        {
            try
            {
                var DeleteFilePath = HttpContext.Current.Server.MapPath("/Upload/" + FileName);
                FileInfo file = new FileInfo(DeleteFilePath);
                if (file.Exists)//check file exsit or not  
                {
                    file.Delete();
                }
            }
            catch { }
        }
        public string SaveFile(HttpPostedFileBase Image)
        {
            string ResultFile = string.Empty;
            try
            {
                if (Image != null && Image.ContentLength > 0)
                {
                    string mapPath = HttpContext.Current.Server.MapPath("/Upload");
                    Guid guid = Guid.NewGuid();
                    string fileExtention = Path.GetExtension(Image.FileName);
                    ResultFile = guid.ToString() + fileExtention;
                    string fullPath = Path.Combine(mapPath, ResultFile);
                    Image.SaveAs(fullPath);
                }
            }
            catch { }
            return ResultFile;
        }
    }
}
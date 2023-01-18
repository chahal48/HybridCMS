using HybridCMSDll.DataAccess;
using HybridCMSDll.Interface;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSBll
{
    public class PageBll
    {
        IPage iPage;

        public PageBll()
        {
            iPage = new SQLPage();
        }
        public bool CheckUrlAlreadyExists(string url)
        {
            return iPage.CheckUrlAlreadyExists(url);
        }
        public bool AddPage(string Name, Int64 UserId, string URL, string Description, string Photo)
        {
            return iPage.AddPage(Name: Name,UserId: UserId,URL: URL,Description: Description,Photo: Photo);
        }
        public List<AdminPageListView> GetAllPageByUserId(Int64 UserId)
        {
            return iPage.GetAllPageByUserId(UserId);
        }
    }
}

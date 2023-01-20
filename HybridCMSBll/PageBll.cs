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
        public bool AddPost(Int64 AssetId, string Heading, string Description, string EncodedHtml, string Photo)
        {
            return iPage.AddPost(AssetId:AssetId,Heading:Heading,Description:Description,EncodedHtml:EncodedHtml,Photo:Photo);
        }
    }
}

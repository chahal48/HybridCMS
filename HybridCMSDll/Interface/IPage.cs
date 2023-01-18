using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSDll.Interface
{
    public interface IPage
    {
        bool CheckUrlAlreadyExists(string url);
        bool AddPage(string Name, Int64 UserId, string URL, string Description, string Photo);
        List<AdminPageListView> GetAllPageByUserId(Int64 UserId);
    }
}

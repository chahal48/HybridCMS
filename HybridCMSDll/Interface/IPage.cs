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
        bool AddPost(Int64 AssetId, string Heading, string Description, string EncodedHtml, string Photo);
    }
}

using HybridCMSDll.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSDll.DataAccess
{
    public partial class SQLComment : SQLBase, IComment
    {
        public SQLComment() : base() { }
    }
}

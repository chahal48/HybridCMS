﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSDll.DataAccess
{
    public abstract class SQLBase
    {
        public SQLBase()
        {

        }
        /// <summary>
        /// return connection string
        /// </summary>
        /// <returns></returns>
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        }
        /// <summary>
        /// procedure success/failure healper method
        /// </summary>
        /// <param name="result"></param>
        /// <returns></returns>
        public static bool ReturnBool(int result)
        {
            return result > 0;
        }
    }
}

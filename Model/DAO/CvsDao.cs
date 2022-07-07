using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.DAO
{
    public class CvsDao
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        public bool Create(Cv cV)
        {
            try
            {
                db.Cvs.Add(cV);
                db.SaveChanges();
                return true;

            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Edit(Cv cV)
        {
            try
            {
                db.Entry(cV).State = EntityState.Modified;
                db.SaveChanges();
                return true;

            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}

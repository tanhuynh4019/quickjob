using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using Common;

namespace Model.DAO
{
    public class UsersDAO
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        //---------------------------------------------CANDIDATE-----------------------------------------------------------
        public bool Login(string email, string pass)
        {
            try
            {
                var passhash = Encryptor.MD5Hash(pass);
                var check = db.Users.Where(n=>n.role_id == 1).SingleOrDefault(n => n.user_email == email && n.user_pass == passhash && n.role_id == 1);
                if(check != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception)
            {
                return false;
            }
        }
        public int SignUp(User user)
        {

            try
            {
                User check = db.Users.SingleOrDefault(n => n.user_email == user.user_email && n.role_id == 1);
                if (check != null)
                {
                    return 2;
                }
                else
                {
                    user.user_active = true;
                    user.user_img = "146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png";
                    user.user_option = true;
                    user.user_datecreate = DateTime.Now;
                    user.user_dateupdate = DateTime.Now;
                    user.user_pass = Encryptor.MD5Hash(user.user_pass);
                    user.role_id = 1;
                    user.version_id = 1;
                    user.user_bin = false;
                    db.Users.Add(user);
                    db.SaveChanges();
                    return 3;
                }
            }
            catch (Exception)
            {

                return 1;
            }
        }
        //---------------------------------------------EMPLOYER-----------------------------------------------------------
        public bool LoginEm(string email, string pass)
        {
            try
            {
                var passhash = Encryptor.MD5Hash(pass);
                var check = db.Users.Where(n => n.role_id == 2).SingleOrDefault(n => n.user_email == email && n.user_pass == passhash && n.role_id == 2);
                if (check != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        public int SignUpEm(User user)
        {

            try
            {
                User check = db.Users.SingleOrDefault(n => n.user_email == user.user_email && n.role_id == 2);
                if (check != null)
                {
                    return 2;
                }
                else
                {
                    user.user_active = true;
                    user.user_img = "146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png";
                    user.user_option = true;
                    user.user_datecreate = DateTime.Now;
                    user.user_dateupdate = DateTime.Now;
                    user.user_pass = Encryptor.MD5Hash(user.user_pass);
                    user.role_id = 2;
                    user.version_id = 1;
                    user.employer_pageload = null;
                    db.Users.Add(user);
                    db.SaveChanges();
                    return 3;
                }
            }
            catch (Exception)
            {

                return 1;
            }
        }
        //---------------------------------------------ADMIN-----------------------------------------------------------
        public bool LoginAd(string email, string pass)
        {
            try
            {
                var passhash = Encryptor.MD5Hash(pass);
                var check = db.Users.SingleOrDefault(n => n.user_email == email && n.user_pass == passhash && n.role_id == 3);
                if (check != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}

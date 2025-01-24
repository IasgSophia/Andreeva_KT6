using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.IO;

namespace PetshopApp.Classes
{
    class Manager
    {
        public static Frame MainFrame { get; set; }
        public static Data.User CurrentUser { get; set; }
        public static void GetImageData()
        {
            var list = Data.databaseEntities.GetContext().Product.ToList();
            foreach(var item in list)
            {
                string path = Directory.GetCurrentDirectory() + @"/img/" + item.PhotoName;
                if (File.Exists(path))
                {
                    item.PhotoProduct = File.ReadAllBytes(path);
                }
                Data.databaseEntities.GetContext().SaveChanges();
            }
            return;
        }
        
    }
}

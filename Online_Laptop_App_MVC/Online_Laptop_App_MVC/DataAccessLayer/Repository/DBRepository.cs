using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Repository
{
    public class DBRepository : IDBRepository
    {

            public DataSet GetProducts()
            {
                return DataAccessHelper.GetProducts();
            }

        public int Login(string name, string Password)
        {
            return DataAccessHelper.Login(name, Password);
        }

        public int submitOrder(int Productid, string OrderNumber, int CustomerId)
        {
            return DataAccessHelper.submitOrder(Productid, OrderNumber, CustomerId);
        }
        public DataTable GetProductyId(int id)
        {
            return DataAccessHelper.GetProductyId(id);
        }
    }
}

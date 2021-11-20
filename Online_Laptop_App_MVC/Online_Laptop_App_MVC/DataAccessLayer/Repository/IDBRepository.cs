using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Repository
{
    public interface IDBRepository
    {
        DataSet GetProducts();
        int submitOrder(int Productid, string OrderNumber, int CustomerId);
        int Login(string name, string Password);
        DataTable GetProductyId(int id);
        }
}

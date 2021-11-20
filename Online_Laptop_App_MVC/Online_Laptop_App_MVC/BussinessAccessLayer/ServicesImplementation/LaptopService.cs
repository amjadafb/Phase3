using BussinessAccessLayer.IServices;
using DataAccessLayer.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BussinessAccessLayer.ServicesImplementation
{
    public class LaptopService: ILaptopService
    {
        IDBRepository _dBRepository;

        public DataSet GetProducts()
        {
            _dBRepository = new DBRepository();
            return _dBRepository.GetProducts();
        }

        public int Login(string name, string Password)
        {
            _dBRepository = new DBRepository();
            return _dBRepository.Login(name, Password);
        }

        public int submitOrder(int Productid, string OrderNumber, int CustomerId)
        {
            _dBRepository = new DBRepository();
            return _dBRepository.submitOrder(Productid, OrderNumber, CustomerId);
        }
        public DataTable GetProductyId(int id) 
        {
            _dBRepository = new DBRepository();
            return _dBRepository.GetProductyId(id);
        }
    }
}

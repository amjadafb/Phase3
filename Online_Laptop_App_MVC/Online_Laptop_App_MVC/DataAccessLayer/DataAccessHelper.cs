using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DataAccessHelper
    {
        static SqlConnection sqlConnection;
        static SqlCommand sqlCommand;
        static SqlDataAdapter sqlDataAdapter;
        static DataSet dst;
        public static void CreateConnection()
        {
            sqlConnection = new SqlConnection(@"Data Source=LAPTOP-H03OU10F\SQLEXPRESS;Initial Catalog=LaptopPortal;Integrated Security=True;");
        }

        public static void CloseConnection()
        {
            sqlConnection.Close();
        }
        public static void OpenConnection()
        {
            sqlConnection.Open();
        }
        public static int Login(string email, string Password) {

            CreateConnection();
            sqlCommand = new SqlCommand("sp_login_info", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@email", email.ToString());
            sqlCommand.Parameters.AddWithValue("@pass", Password.ToString());
            OpenConnection();
            DataTable dt = new DataTable();
            dt.Load(sqlCommand.ExecuteReader());
            int CustomerId = Convert.ToInt32(dt.Rows[0].ItemArray[0].ToString());
            CloseConnection();
            return CustomerId;
        }
        public static DataSet GetProducts()
        {
            CreateConnection();
            sqlDataAdapter = new SqlDataAdapter("sp_get_products", sqlConnection);
            dst = new DataSet();
            sqlDataAdapter.Fill(dst, "Product");
            return dst;
        }
        public static DataTable GetProductyId(int id) 
        {
            CreateConnection();
            sqlCommand = new SqlCommand("sp_get_product_byId", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@pid", id.ToString());
            OpenConnection();
            DataTable dt = new DataTable();
            dt.Load(sqlCommand.ExecuteReader());
            CloseConnection();
            return dt;
        }
        public static int submitOrder(int Productid, string OrderNumber, int CustomerId)
        {
            CreateConnection();
            sqlCommand = new SqlCommand("sp_submit_order", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@pid", Productid);
            sqlCommand.Parameters.AddWithValue("@OrderNumber", OrderNumber);
            OpenConnection();
            DataTable dt = new DataTable();
            dt.Load(sqlCommand.ExecuteReader());
            int OrderId = Convert.ToInt32(dt.Rows[0].ItemArray[0].ToString());
            CloseConnection();
            int result = AddRelation(OrderId, CustomerId);
            return result;
        }

        private static int AddRelation(int orderId, int customerId)
        {
            CreateConnection();
            sqlCommand = new SqlCommand("sp_add_relation", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@Oid", orderId);
            sqlCommand.Parameters.AddWithValue("@CustomerId", customerId);
            OpenConnection();
            DataTable dt = new DataTable();
            dt.Load(sqlCommand.ExecuteReader());
            int CustunerOrderId = Convert.ToInt32(dt.Rows[0].ItemArray[0].ToString());
            CloseConnection();
            return CustunerOrderId;
        }
    }
}

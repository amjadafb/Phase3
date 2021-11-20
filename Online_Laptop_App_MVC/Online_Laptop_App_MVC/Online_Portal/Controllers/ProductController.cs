using BussinessAccessLayer.IServices;
using BussinessAccessLayer.ServicesImplementation;
using Online_Portal.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Online_Portal.Controllers
{
    public class ProductController : Controller
    {
        [UserAuthenticationFilter]
        // GET: Product
        public ActionResult Index()
        {
            ILaptopService Service = new LaptopService();
            var ds = Service.GetProducts();
            var Products = ds.Tables[0].AsEnumerable()
            .Select(dataRow => new Product
            {
                ProductId = dataRow.Field<int>("ProductId"),
                ProductName = dataRow.Field<string>("ProductName"),
                IsAvaliable = dataRow.Field<bool>("IsAvaliable"),
                BrandName = dataRow.Field<string>("BrandName"),
                CategoryName = dataRow.Field<string>("CategoryName")
            }).ToList();
            return View(Products);
        }
        [UserAuthenticationFilter]
        // GET: Product/Details/5
        public ActionResult Details(int id)
        {
            ILaptopService Service = new LaptopService();
            var ds = Service.GetProductyId(id);
            var product = new Product();
            product.ProductId = Convert.ToInt32(ds.Rows[0]["ProductId"]);
            product.ProductName = (ds.Rows[0]["ProductName"]).ToString();
            product.IsAvaliable = (bool)ds.Rows[0]["IsAvaliable"];
            product.BrandName = (ds.Rows[0]["BrandName"]).ToString();
            product.CategoryName = (ds.Rows[0]["CategoryName"]).ToString();
            return View(product);
        }
        [UserAuthenticationFilter]
        public ActionResult AddToCart(int id)
        {
            ILaptopService Service = new LaptopService();
            var ds = Service.GetProductyId(id);
            var product = new Product();
            product.ProductId = Convert.ToInt32(ds.Rows[0]["ProductId"]);
            product.ProductName = (ds.Rows[0]["ProductName"]).ToString();
            product.IsAvaliable = (bool)ds.Rows[0]["IsAvaliable"];
            product.BrandName = (ds.Rows[0]["BrandName"]).ToString();
            product.CategoryName = (ds.Rows[0]["CategoryName"]).ToString();
            if (Session["cart"] == null)
            {
                List<Product> cart = new List<Product>();
                cart.Add(product);
                Session["cart"] = cart;
            }
            else
            {
                List<Product> cart = (List<Product>)Session["cart"];
                cart.Add(product);
                Session["cart"] = cart;
            }
            return RedirectToAction("Cart");
        }
        [UserAuthenticationFilter]
        public ActionResult Cart()
        {
            List<Product> cart;
            if (Session["cart"] == null)
            {
                cart = new List<Product>();
                Session["cart"] = cart;
            }
            else
            {
                cart = (List<Product>)Session["cart"];
                Session["cart"] = cart;
            }
            return View(cart);
        }
        [UserAuthenticationFilter]
        public ActionResult Remove(int id)
        {
            List<Product> cart = (List<Product>)Session["cart"];
            int index = isExist(id);
            cart.RemoveAt(index);
            Session["cart"] = cart;
            return RedirectToAction("Index");
        }
        [UserAuthenticationFilter]
        private int isExist(int id)
        {
            List<Product> cart = (List<Product>)Session["cart"];
            for (int i = 0; i < cart.Count; i++)
            {
                if (cart[i].ProductId == id)
                    return i;
            }
            return -1;
        }
    }
}
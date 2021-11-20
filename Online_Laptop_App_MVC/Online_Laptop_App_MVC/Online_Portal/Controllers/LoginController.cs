using BussinessAccessLayer.IServices;
using BussinessAccessLayer.ServicesImplementation;
using Online_Portal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Online_Portal.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View(new UserLogin());
        }
        public ActionResult ValidateUser(UserLogin userLogin)
        {
            ILaptopService Service = new LaptopService();
            var CustomerId = Service.Login(userLogin.Email, userLogin.Password);
            if (CustomerId != -1)
            {
                Session["UserID"] = Guid.NewGuid();
                Session["CustomerId"] = CustomerId;
                return RedirectToAction("Index", "Product");
            }
            else
            {
                ModelState.AddModelError("", "Invalid");
                return RedirectToAction("Index");
            }
        }
        [UserAuthenticationFilter]
        public ActionResult Logout()
        {
            Session["UserID"] = null;
            Session["CustomerId"] = null;
            return RedirectToAction("Index");
        }
    }
}
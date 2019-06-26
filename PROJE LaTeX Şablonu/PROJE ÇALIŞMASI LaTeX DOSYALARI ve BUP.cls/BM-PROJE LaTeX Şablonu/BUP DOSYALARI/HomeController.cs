using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using cucu;
using MathWorks.MATLAB.NET.Arrays;
using System.Threading.Tasks;
using HttpPostedFileHelper;
namespace bulut.Controllers
{
 public class HomeController : Controller
 {
  public ActionResult Index()
  {        
   return View();
  }
[HttpPost]
public ActionResult Index(HttpPostedFileBase Imagee)
{
 if (Imagee != null)
    {
    var dosyaYolu=Path.GetFileName(Imagee.FileName);
    var yuklemeYeri=Path.Combine(Server.MapPath("~/Image")
	,dosyaYolu);
    Imagee.SaveAs(yuklemeYeri);
    }
    Class1 obj = new Class1();
    MWArray output=obj.cucu("C:\\P\\xx\\bulut\\bulut\\Image\\"
	+Imagee.FileName);
    var sayi = output.ToString();
    ViewData["kisisayisi"] = sayi;
    TempData["dosyayolu"] = Imagee.FileName.ToString(); 
    return View();
  }
 }
}


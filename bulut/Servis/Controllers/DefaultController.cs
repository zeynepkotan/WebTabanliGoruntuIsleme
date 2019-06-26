using cucu;
using MathWorks.MATLAB.NET.Arrays;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace Servis.Controllers
{
    public class DefaultController : ApiController
    {
        public class talep
        {
            public string yol { get; set; }
        }
        [HttpPost]
        public string test(talep t)
        {
            
            Class1 obj = new Class1();
            MWArray output = obj.cucu(t.yol);
            return output.ToString();


        }
      




        public string Post()
        {
            HttpResponseMessage result = null;
            var httpRequest = HttpContext.Current.Request;
            if (httpRequest.Files.Count > 0)
            {
                var docfiles = new List<string>();
                foreach (string file in httpRequest.Files)
                {
                    var postedFile = httpRequest.Files[file];
                    var filePath = HttpContext.Current.Server.MapPath("~/" + postedFile.FileName);
                    postedFile.SaveAs(filePath);
                    docfiles.Add(filePath);
                    
                }
             
            }
            else
            {
                result = Request.CreateResponse(HttpStatusCode.BadRequest);
            }
            
            return "-1";
        }
    }
}

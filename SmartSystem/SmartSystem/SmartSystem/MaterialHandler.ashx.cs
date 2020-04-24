using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace SmartSystem
{
    /// <summary>
    /// Summary description for MaterialHandler
    /// </summary>
    public class MaterialHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            Entities db = new Entities();
            var ItemName = context.Request["term"] ?? "";
            List<string> MaterialList = new List<string>();

            var materi = db.Materials.Where(x => x.MaterialName.Contains(ItemName)).ToList();
            foreach (var item in materi)
            {
                MaterialList.Add(item.MaterialName);
            }

            JavaScriptSerializer JS = new JavaScriptSerializer();
            context.Response.Write(JS.Serialize(MaterialList));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
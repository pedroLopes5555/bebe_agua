using Microsoft.EntityFrameworkCore.Storage;
using System.Security.Principal;

namespace bebe_agua_backend_v2._0.Models.JsonContents
{
    public class SaveRegistJsonContent
    {
        public SaveRegistJsonContent()
        {
            
        }

        public  float waterDrunk { get; set; }
        public DateTime? Date { get; set; }
    }

}

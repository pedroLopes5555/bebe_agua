using bebe_agua_backend.Models;
using bebe_agua_backend_v2._0.Models.JsonContents;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Mvc.ActionConstraints;

namespace bebe_agua_backend.Interfaces
{
    public interface IDrinkWatterRepository
    {
        ICollection<Regist> GetRegists();
        void saveRegist(SaveRegistJsonContent content);
    }
}

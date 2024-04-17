using bebe_agua_backend.Models;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Mvc.ActionConstraints;

namespace bebe_agua_backend.Interfaces
{
    public interface IDrinkWatterRepository
    {
        ICollection<Regist> GetRegists();
        bool saveRegist(Regist regist);
    }
}

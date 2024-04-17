using bebe_agua_backend.Interfaces;
using bebe_agua_backend.Models;
using Microsoft.AspNetCore.Mvc;

namespace bebe_agua_backend.Controllers
{
    public class DrinkWatterController : Controller
    {
        private readonly IDrinkWatterRepository _registRepository;
        public DrinkWatterController(IDrinkWatterRepository registRepository)
        {
            _registRepository = registRepository;
        }


        public IActionResult GetAllRegists()
          {
            var regists = _registRepository.GetRegists();
            
            if(!ModelState.IsValid)
                return Json(BadRequest(ModelState));

            return Json(regists);
        }



        public IActionResult test()
        {
            return Ok();
        }

    }
}






















//{
//    "id": 1,
//    "watterDrunk": 3.3316925
//  },
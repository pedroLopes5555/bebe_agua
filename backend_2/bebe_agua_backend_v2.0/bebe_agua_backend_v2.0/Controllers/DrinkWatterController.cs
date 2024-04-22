using bebe_agua_backend.Interfaces;
using bebe_agua_backend.Models;
using bebe_agua_backend_v2._0.Models.JsonContents;
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

        public IActionResult SaveRegist([FromBody] SaveRegistJsonContent content) 
        {
            _registRepository.saveRegist(content)
            return Ok();
        }

        public IActionResult getDayWatterDrunk() { return View(); }



        public IActionResult test()
        {
            var test = new SaveRegistJsonContent();
            test.waterDrunk = 10;
            test.Date = DateTime.Now;
            return Json(test);
        }

    }
}






















//{
//    "id": 1,
//    "watterDrunk": 3.3316925
//  },
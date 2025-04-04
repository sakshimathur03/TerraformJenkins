using WebApplication3.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Day2Tut.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private static List<Product> products = new List<Product>
        {
            new Product {Id = 1, Name = "Laptop", Price = 45000},
            new Product {Id = 2, Name = "Mobile", Price = 35000},
            new Product { Id = 3, Name = "Tab", Price = 25000}
            };
        [HttpGet]
        public IActionResult GetProducts()
        {
            return Ok(products);
        }
        [HttpPost]
        public IActionResult AddProduct([FromBody] Product productObj)
        {
            if (ModelState.IsValid == false)
            {
                return BadRequest(ModelState);
            }
            products.Add(productObj);
            return Created("", productObj);
            return Ok("New Product is added to server");
        }




    }
}

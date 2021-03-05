using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CodeModel;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Authorization;
using WebApi.Services;
using WebApi.Model;

namespace WebApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]    
    public class PaymentController : ControllerBase
    {
        private IPaymentService _paymentService;

        public PaymentController(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }

        private readonly PaymentEntities db = new PaymentEntities();

        [AllowAnonymous]
        [HttpGet("initial")]
        public IActionResult Initial()
        {
            return Ok(new { message = "Welcome to Code Test" });
        }

        [AllowAnonymous]
        [HttpPost("authenticate")]
        public async Task<IActionResult> Authenticate([FromBody] Authenticate model)
        {
            var payment = await _paymentService.Authenticate(model.Username, model.Password);

            if (payment == null)
                return BadRequest(new { message = "Username or password is incorrect" });

            return Ok(new {message = "Login Successful"});
        }


        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var payments = await _paymentService.GetAll();
            return Ok(payments);
        }     

        [HttpGet("{id}")]
        public async Task<IActionResult> GetPayment(int id)
        {
            var payment = await _paymentService.GetPayment(id);
            return Ok(payment);
        }
    }
}

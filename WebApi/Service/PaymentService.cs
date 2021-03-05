using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CodeModel;
using WebApi.Model;

namespace WebApi.Services
{
    public interface IPaymentService
    {
        Task<User> Authenticate(string username, string password);
        Task<IEnumerable<PaymentViewModel>> GetAll();
        Task<IQueryable<PaymentItemModel>> GetPayment(int id);
        
    }

    public class PaymentService : IPaymentService
    {
        private readonly PaymentEntities db = new PaymentEntities();

        public async Task<User> Authenticate(string username, string password)
        {           
            var user = await Task.Run(() => db.Users.SingleOrDefault(u => u.UserName == username && u.Password == password));

            // return null if user not found
            if (user == null)
                return null;
            else
                user.Password = null;

            // authentication successful so return user details without password
            return user;
             
        }

        public async Task<IEnumerable<PaymentViewModel>> GetAll()
        {
            var paymentList = db.Database.SqlQuery<PaymentViewModel>("EXEC dbo.GetPayments").ToList();
            return await Task.Run(() => paymentList);
        }

        public async Task<IQueryable<PaymentItemModel>> GetPayment(int id)
        {
            var payment = db.Payments.Where(p => p.PaymentID == id)
                  .Select(p => new PaymentItemModel
                  {
                      PaymentID = p.PaymentID,
                      PaymentDate = p.PaymentDate,
                      AccountType = p.Account.AccountType.Type,
                      Amount = p.Amount,
                      Description = p.Description,
                      PaymentStatus = p.PaymentStatu.PaymentStatusName,
                      AccountBalance = p.AfterBalance
                  });

            return await Task.Run(() => payment);
        }
    }
}
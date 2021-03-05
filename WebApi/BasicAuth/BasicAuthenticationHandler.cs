using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Logging;
using System.Text.Encodings.Web;
using Microsoft.AspNetCore.Http;
using WebApi.Services;
using CodeModel;
using System.Security.Claims;

namespace WebApi
{
    public class BasicAuthenticationHandler : AuthenticationHandler<AuthenticationSchemeOptions>
    {
        private readonly IPaymentService _paymentService;
        public BasicAuthenticationHandler(
           IOptionsMonitor<AuthenticationSchemeOptions> options,
           ILoggerFactory logger,
           UrlEncoder encoder,
           ISystemClock clock,
           IPaymentService paymentService)
           : base(options, logger, encoder, clock)
        {
            _paymentService = paymentService;
        }

        protected override async Task<AuthenticateResult> HandleAuthenticateAsync()
        {
            // skip authentication if endpoint has [AllowAnonymous] attribute
            var endpoint = Context.GetEndpoint();
            if (endpoint?.Metadata?.GetMetadata<IAllowAnonymous>() != null)
                return AuthenticateResult.NoResult();

            if (!Request.Headers.ContainsKey("Authorization"))
                return AuthenticateResult.Fail("Missing Authorization Header");

            User user = null;
            try
            {
                var authHeader = AuthenticationHeaderValue.Parse(Request.Headers["Authorization"]);
                var credentialBytes = Convert.FromBase64String(authHeader.Parameter);
                var credentials = Encoding.UTF8.GetString(credentialBytes).Split(new[] { ':' }, 2);
                var username = credentials[0];
                var password = credentials[1];
                user = await _paymentService.Authenticate(username, password);
            }
            catch
            {
                return AuthenticateResult.Fail("Invalid Authorization Header");
            }

            if (user == null)
                return AuthenticateResult.Fail("Invalid Username or Password");

            var claims = new[] {
                new Claim(ClaimTypes.NameIdentifier, user.UserID.ToString()),
                new Claim(ClaimTypes.Name, user.UserName),
            };
            var identity = new ClaimsIdentity(claims, Scheme.Name);
            var principal = new ClaimsPrincipal(identity);
            var ticket = new AuthenticationTicket(principal, Scheme.Name);

            return AuthenticateResult.Success(ticket);
        }

        //public void OnAuthorization(AuthorizationFilterContext context)
        //{
        //    try
        //    {
        //        string authHeader = context.HttpContext.Request.Headers["Authorization"];
        //        if (authHeader == null)                
        //            ReturnUnauthorizedResult(context);
        //        else
        //        {
        //            var authHeaderValue = AuthenticationHeaderValue.Parse(authHeader);
        //            if (authHeaderValue.Scheme.Equals(AuthenticationSchemes.Basic.ToString(), StringComparison.OrdinalIgnoreCase))
        //            {
        //                var credentials = Encoding.UTF8
        //                                    .GetString(Convert.FromBase64String(authHeaderValue.Parameter ?? string.Empty))
        //                                    .Split(':', 2);
        //                if (credentials.Length == 2)
        //                {
        //                    if (IsAuthorized(context, credentials[0], credentials[1]))
        //                    {
        //                        return;
        //                    }
        //                    else
        //                        ReturnUnauthorizedResult(context);
        //                }
        //                else
        //                    ReturnUnauthorizedResult(context);
        //            }
        //        }              

        //        ReturnUnauthorizedResult(context);
        //    }
        //    catch (FormatException)
        //    {
        //        ReturnUnauthorizedResult(context);
        //    }
        //}

        //public bool IsAuthorized(AuthorizationFilterContext context, string username, string password)
        //{
        //    var userService = context.HttpContext.RequestServices.GetRequiredService<IUserService>();
        //    return userService.IsValidUser(username, password);
        //}

        //private void ReturnUnauthorizedResult(AuthorizationFilterContext context)
        //{
        //    // Return 401 and a basic authentication challenge (causes browser to show login dialog)
        //    context.HttpContext.Response.Headers["WWW-Authenticate"] = $"Basic realm=\"{_permission}\"";
        //    context.Result = new UnauthorizedResult();
        //}
    }
}

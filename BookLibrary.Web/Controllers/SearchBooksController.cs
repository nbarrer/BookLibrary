using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BookLibrary.DAL.Models;
using BookLibrary.DAL.Repositories;

namespace BookLibrary.Web.Controllers
{
    public class SearchBooksController : Controller
    {
        private IBookRepository bookrepository;
        
        public SearchBooksController()
        {
            BookModelContainer db = new BookModelContainer();
            bookrepository = new BookRepository(db);
        }

        // GET: SearchBooks
        public async Task<ActionResult> Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> Find(string query)
        {
            try
            {
                ViewBag.CurrentFilter = query;

                if (!string.IsNullOrEmpty(query))
                {
                    string strSearchBy = Request.Form["searchBy"];
                    Session["SearchBy"] = ViewBag.SearchBy = strSearchBy;
                    if (strSearchBy == "Author" && !string.IsNullOrWhiteSpace(query))
                    {                        
                        IEnumerable<Book> books = await bookrepository.GetBooksByAuthor(query);
                        return View("Index", books);
                    }
                    else if (strSearchBy == "Category" && !string.IsNullOrWhiteSpace(query))
                    {
                        IEnumerable<Book> books = await bookrepository.GetBooksByCategory(query);
                        return View("Index", books);
                    }                    
                }
                var all_books = bookrepository.GetBooks();
                return View(all_books);
            }
            catch (Exception ex)
            {                
                return new HttpStatusCodeResult(HttpStatusCode.InternalServerError);
            }
        }

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        db.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}
    }
}

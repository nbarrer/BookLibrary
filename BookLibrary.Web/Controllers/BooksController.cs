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
    public class BooksController : Controller
    {
        private IBookRepository bookRepository;
        private IAuthorRepository authorRepository;
        private ICategoryRepository categoryRepository;

        public BooksController()
        {
            BookModelContainer db = new BookModelContainer();
            this.bookRepository = new BookRepository(db);
            this.authorRepository = new AuthorRepository(db);
            this.categoryRepository = new CategoryRepository(db);
        }

        // GET: Books
        public async Task<ActionResult> Index()
        {
            IEnumerable<Book> books = await bookRepository.GetBooks();            
            return View(books);
        }

        // GET: Books/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = await bookRepository.GetBookByID((int)id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        // GET: Books/Create
        public async Task<ActionResult> Create()
        {
            IEnumerable<Author> authors = await authorRepository.GetAuthors();
            IEnumerable<Category> categories = await categoryRepository.GetCategories();

            ViewBag.AuthorID = new SelectList(authors, "Id", "FullName" );
            ViewBag.CategoryID = new SelectList(categories, "Id", "Name");
            return View();
        }

        // POST: Books/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Name,AuthorID,CategoryID")] Book book)
        {
            if (ModelState.IsValid)
            {
                Author author = await authorRepository.GetAuthorByID(book.AuthorId);
                book.Author = author;

                var category = await categoryRepository.GetCategoryByID(book.CategoryId);
                book.Category = category;

                await bookRepository.InsertBook(book);
                return RedirectToAction("Index");
            }

            return View(book);
        }

        // GET: Books/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IEnumerable<Author> authors = await authorRepository.GetAuthors();
            IEnumerable<Category> categories = await categoryRepository.GetCategories();

            Book book = await bookRepository.GetBookByID((int)id);
            ViewBag.AuthorID = new SelectList(authors, "Id", "FullName", book.AuthorId);
            ViewBag.CategoryID = new SelectList(categories, "Id", "Name", book.CategoryId);
            
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        // POST: Books/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name,AuthorID,CategoryID")] Book book)
        {
            if (ModelState.IsValid)
            {
                await bookRepository.UpdateBook(book);
                return RedirectToAction("Index");
            }
            return View(book);
        }

        // GET: Books/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = await bookRepository.GetBookByID((int)id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        // POST: Books/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            await bookRepository.DeleteBook(id);
            return RedirectToAction("Index");
        }

        //protected override async Task Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        await bookRepository.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}
    }
}

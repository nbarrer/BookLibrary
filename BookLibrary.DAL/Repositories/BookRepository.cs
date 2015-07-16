using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookLibrary.DAL.Models;

namespace BookLibrary.DAL.Repositories
{
    public class BookRepository : IBookRepository, IDisposable
    {
        private BookModelContainer context;

        public BookRepository(BookModelContainer context)
        {
            this.context = context;
        }

        public async Task<IEnumerable<Book>> GetBooks()
        {
            return await context.Books.OrderBy(b => b.Name).ToListAsync();
        }

        public async Task<Book> GetBookByID(int id)
        {
            return await context.Books.FindAsync(id);
        }

        public async Task InsertBook(Book book)
        {
            //context.Books.Add(book);
            //await context.SaveChangesAsync();
            context.Books.Add(book);
            await context.SaveChangesAsync();
        }

        public async Task DeleteBook(int bookID)
        {
            Book book = context.Books.Find(bookID);
            book.Author = null;
            book.Category = null;
            context.Books.Remove(book);
            await context.SaveChangesAsync();
        }

        public async Task UpdateBook(Book book)
        {
            context.Entry(book).State = EntityState.Modified;
            await context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Book>> GetBooksByCategory(int categoryID)
        {
            return await context.Books.Include(b => b.Category).Where(c => c.Category.Id == categoryID).ToListAsync();
        }
        public async Task<IEnumerable<Book>> GetBooksByAuthor(string name)
        {
            return await context.Books.Where(c => c.Author.LastName.Contains(name)
                                            || c.Author.FirstName.Contains(name) 
                                            || name == null)
                                        .ToListAsync();            
        }

        public async Task<IEnumerable<Book>> GetBooksByCategory(string name)
        {
            return await context.Books.Where(c => c.Category.Name.Contains(name)
                                            || name == null)
                                        .ToListAsync();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookLibrary.DAL.Models;

namespace BookLibrary.DAL.Repositories
{
    public interface IBookRepository : IDisposable
    {
        Task<IEnumerable<Book>> GetBooks();
        Task<Book> GetBookByID(int bookId);
        Task InsertBook(Book book);
        Task DeleteBook(int bookID);
        Task UpdateBook(Book book);
        //Task Save();
        Task<IEnumerable<Book>> GetBooksByCategory(string name);
        Task<IEnumerable<Book>> GetBooksByAuthor(string name);
    }
}

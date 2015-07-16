using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookLibrary.DAL.Models;

namespace BookLibrary.DAL.Repositories
{
    public interface IAuthorRepository : IDisposable
    {
        Task<IEnumerable<Author>> GetAuthors();
        Task<Author> GetAuthorByID(int id);
        Task InsertAuthor(Author author);
        Task DeleteAuthor(int authorID);
        Task UpdateAuthor(Author author);        
    }
}

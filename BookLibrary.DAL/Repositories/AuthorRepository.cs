using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookLibrary.DAL.Models;

namespace BookLibrary.DAL.Repositories
{
    public class AuthorRepository : IAuthorRepository, IDisposable
    {
        private BookModelContainer context;

        public AuthorRepository(BookModelContainer context)
        {
            this.context = context;
        }

        public async Task<IEnumerable<Author>> GetAuthors()
        {
            return await context.Authors.OrderBy(a => a.LastName).Where(l => l.Deleted == false).ToListAsync();
        }

        public async Task<Author> GetAuthorByID(int id)
        {
            return await context.Authors.FindAsync(id);
        }

        public async Task InsertAuthor(Author author)
        {
            author.Deleted = false;
            context.Authors.Add(author);
            await context.SaveChangesAsync();
        }

        public async Task DeleteAuthor(int authorID)
        {
            Author author = context.Authors.Find(authorID);
            author.Deleted = true;
            context.Entry(author).State = EntityState.Modified;
            await context.SaveChangesAsync();
        }

        public async Task UpdateAuthor(Author author)
        {
            context.Entry(author).State = EntityState.Modified;
            await context.SaveChangesAsync();
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

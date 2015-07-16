using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookLibrary.DAL.Models;

namespace BookLibrary.DAL.Repositories
{
    public class CategoryRepository : ICategoryRepository, IDisposable
    {
        private BookModelContainer context;

        public CategoryRepository(BookModelContainer context)
        {
            this.context = context;
        }

        public async Task<IEnumerable<Category>> GetCategories()
        {
            return await context.Categories.OrderBy(c => c.Name).Where(l => l.Deleted == false).ToListAsync();
        }

        public async Task<Category> GetCategoryByID(int id)
        {
            return await context.Categories.FindAsync(id);
        }

        public async Task InsertCategory(Category category)
        {
            category.Deleted = false;
            context.Categories.Add(category);
            await context.SaveChangesAsync();
        }

        public async Task DeleteCategory(int categoryID)
        {
            Category category = context.Categories.Find(categoryID);
            category.Deleted = true;
            context.Entry(category).State = EntityState.Modified;
            await context.SaveChangesAsync();
        }

        public async Task UpdateCategory(Category category)
        {
            context.Entry(category).State = EntityState.Modified;
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

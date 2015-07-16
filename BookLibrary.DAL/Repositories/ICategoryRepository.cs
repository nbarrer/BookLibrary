using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookLibrary.DAL.Models;

namespace BookLibrary.DAL.Repositories
{
    public interface ICategoryRepository
    {
        Task<IEnumerable<Category>> GetCategories();

        Task<Category> GetCategoryByID(int id);
        Task InsertCategory(Category category);
        Task DeleteCategory(int categoryID);
        Task UpdateCategory(Category category);
    }
}

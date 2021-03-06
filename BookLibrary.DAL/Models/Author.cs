//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BookLibrary.DAL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    
    public partial class Author
    {
        public Author()
        {
            this.Book = new HashSet<Book>();
        }
    
        public int Id { get; set; }
        [Required(ErrorMessage="The field First Name is required")]
        [Display(Name="First Name")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "The field Last Name is required")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        public string Fullname
        {
            get
            {
                return string.Format("{0} {1}", LastName, FirstName);
            }
        }
        public Nullable<bool> Deleted { get; set; }
    
        public virtual ICollection<Book> Book { get; set; }
    }
}

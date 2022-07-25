using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LaikaSFS.Website.Models.Planet
{
    [Table("Tree", Schema = "Menu")]
    public partial class Tree
    {
        public Tree()
        {
            InverseParent = new HashSet<Tree>();
        }

        [Key]
        public int Id { get; set; }
        public int? ParentId { get; set; }
        [StringLength(50)]
        public string MenuType { get; set; } = null!;
        [StringLength(50)]
        public string Title { get; set; } = null!;
        public int OrderBy { get; set; }

        [ForeignKey("ParentId")]
        [InverseProperty("InverseParent")]
        public virtual Tree? Parent { get; set; }
        [InverseProperty("Parent")]
        public virtual ICollection<Tree> InverseParent { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet;

public partial class AuditLog {
    [Key]
    public int Id { get; set; }
    public DateTime TriggerDate { get; set; }
    [StringLength(100)]
    public string SourceContext { get; set; } = null!;
    [StringLength(16)]
    public string Operation { get; set; } = null!;
    [StringLength(64)]
    public string DatabaseName { get; set; } = null!;
    [StringLength(64)]
    public string SchemaName { get; set; } = null!;
    [StringLength(64)]
    public string TableName { get; set; } = null!;
    public int TableId { get; set; }
    public string LogData { get; set; } = null!;
}

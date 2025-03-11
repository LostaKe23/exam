using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminApp.Models
{
    public class Client
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public int YearOfBirth { get; set; }
        public string Address { get; set; }
        public string EGRN { get; set; }
        public string Status { get; set; }
    }

}

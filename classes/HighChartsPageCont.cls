public class HighChartsPageCont
      {
           // for bar chart
           // N for name , v for data
          public class Nv {
             public String n { get; private set; }      
             public integer v { get; private set; }
                Nv(String n,Integer v) {
                 this.n = n;
                 this.v = v;     
            }
         }
      public Nv[] getnvs() {
        return new Nv[] {
            new Nv('Jan',5),
            new Nv('Feb',45),
            new Nv('Mar',35),
            new Nv('Apr',25) ,    
            new Nv('may',15)
          };
        }
      }
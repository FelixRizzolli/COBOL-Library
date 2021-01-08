       01 :V1:-COUNT             BINARY PIC S9(9) VALUE ZERO.
       01 :V1:-STATUS                   PIC  X(2).           
          88 :V1:-OK                    VALUE '00'.          
          88 :V1:-EOF                   VALUE '10'.          
          88 :V1:-MISSING-DD            VALUE '35'.          
          88 :V1:-ERROR                 VALUE '01' THRU '09' 
                                              '11' THRU '34' 
                                              '36' THRU '99'.
       01 :V1:-SW                       PIC  X(1).           
          88 :V1:-NO                    VALUE '0'.           
          88 :V1:-YES                   VALUE '1'.           
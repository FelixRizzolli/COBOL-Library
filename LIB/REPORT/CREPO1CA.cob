       01 CREPO1CA.
           05 CREPO1CA-RC                  PIC  X(3).
           05 CREPO1CA-MSG                 PIC  X(100).
           05 CREPO1CA-ACTION              PIC  X(1).
           05 CREPO1CA-COUNT-RECORDS       PIC S9(9) COMP.
           05 CREPO1CA-COUNT-PAGES         PIC S9(9) COMP.
           05 CREPO1CA-COUNT-LINES         PIC S9(9) COMP.
           05 CREPO1CA-LINES-PER-PAGE      PIC S9(9) COMP.
           05 CREPO1CA-NUM-HEADERS         PIC  9(1).
           05 CREPO1CA-NUM-HEADER-PAGE     PIC  9(1).
           05 CREPO1CA-HEADER              PIC  X(132) OCCURS 9.
           05 CREPO1CA-LINE                PIC  X(132).
           05 CREPO1CA-FILLER1             PIC  X(1558).

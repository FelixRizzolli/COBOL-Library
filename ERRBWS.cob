       01  PGM-VERSION                  PIC  X(17)   VALUE ' '.
       01  PGM-VERSION-2                PIC  X(17)   VALUE ' '.
       01  PGM-ERR-RC                   PIC  X(3)    VALUE '999'.
       01  PGM-ERR-MSG1                 PIC  X(100)  VALUE ' '.
       01  PGM-ERR-MSG2                 PIC  X(100)  VALUE ' '.
       01  PGM-ERR-MSG3                 PIC  X(100)  VALUE ' '.
       01  PGM-END-RC                   PIC  X(3)    VALUE '999'.
       01  PGM-END-MSG1                 PIC  X(100)  VALUE ' '.
      *****************************************************************
       01  PGM-NAME                     PIC  X(8)    VALUE SPACES.
       01  PGM-DATE                     PIC  X(21)   VALUE SPACES.
       01  PGM-DESCRIPTION              PIC  X(71)   VALUE SPACES.
      *---------------------------------------------------------------*
      * PROGRAMMABBRUCH CEE3AB2 (AUTOM. ROLLBACK / DUMPS UNTERDRUECKEN)
      *---------------------------------------------------------------*
       01  PGM-ABCODE            BINARY PIC  S9(9)   VALUE +3333.
       01  PGM-REASONCODE        BINARY PIC  S9(9)   VALUE ZERO.
       01  PGM-CLEAN-UP          BINARY PIC  S9(9)   VALUE +3.
      *****************************************************************
       01  RZSC01                       PIC  X(8)    VALUE 'RZSC01'.
       01  AFUNC                        PIC  X(1)    VALUE 'G'.
       01  AID                          PIC  X(4)    VALUE 'APPT'.
       01  ADATA                        PIC  X(4096) VALUE SPACES.
       01  APOS                         PIC  S9(5)   PACKED-DECIMAL
                                                     VALUE ZERO.
      *****************************************************************
       01  SW-ALOG-DRUCKEN              PIC  X(1)    VALUE SPACES.
       01  SW-ALOG-CALL                 PIC  X(1)    VALUE SPACES.
       01  ALEVEL                       PIC  X(1)    VALUE '3'.
      *****************************************************************
       01  APP-LOG-CMSG                 PIC  X(120)  VALUE ' '.
       01  APP-LOG-MSG1                 PIC  X(100)  VALUE ' '.
       01  APP-LOG-MSG2                 PIC  X(100)  VALUE ' '.
       01  APP-LOG-MSG3                 PIC  X(100)  VALUE ' '.
       01  APP-LOG-LINE                 PIC  X(100)  VALUE ALL '-'.

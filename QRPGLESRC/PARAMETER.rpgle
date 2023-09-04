      *Open Display File TESTSUITE, this contains our display fields
     FTESTSUITE CF   E             WORKSTN
      *Set up our parameter list, this is roughly equivalent to argc and argv in
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH           20
      *Copy the contents of our LAUNCH parm into field PARMOUT defined in TESTSU
     C                   MOVEL     LAUNCH        PARMOUT
      *Now we show the TESTPARM screen from TESTSUITE
     C                   EXFMT     TESTPARM
      *Free memory and exit program (return to caller)
     C                   MOVEL     *ON           *INLR
     C                   RETURN

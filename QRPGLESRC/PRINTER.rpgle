     FQPRINT    O    F  132        PRINTER OFLIND(*IN90)
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH           20
     C
     C                   EXCEPT    TESTPRT
     C                   MOVEL     LAUNCH        PARMOUT
     C                   MOVEL     *ON           *INLR
     C                   RETURN
i    C*----------------------------------------------------------------------
     OQPRINT    E            TESTPRT
     O*GO STUDY THIS SOME MORE... THINK I NEED TO BUILD A TEST PHYS FILE
     O*TO TEST THE PRINTER PROGRAM WITH. NOT SURE I CAN MOVEL
     O*ANY RANDOM STRING INTO THE PRINTER OUTPUT SPEC?
     O*https://www.go4as400.com/as400-printer-files/rpgle.aspx?cid=461

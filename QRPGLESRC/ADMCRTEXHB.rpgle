     FEXHBDB    UF A E           K DISK
     FEXHBMENUSCCF   E             WORKSTN
     DUSERPROF         S              9A
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH            9
     C*-----------------------------------------------------------------------
     C*                  MOVEL     LAUNCH        PARMOUT
     C                   EXFMT     ADMCREATE
     C*
     C*                  TODO: Put this part in its own SR
     C*                  and allow for multiple uses of program
     C*
     C                   READ      EXHBDB                                 90
     C     *IN90         DOWEQ     *OFF
     C                   READ      EXHBDB                                 90
     C                   ENDDO
     C                   MOVEL     INTITLE       EXHBTITLE
     C                   MOVEL     INNAME        EXHBITOR
     C                   MOVEL     INCITY        EXHBCITY
     C                   MOVEL     INSTATE       EXHBSTATE
     C                   MOVEL     INDESC        EXHBDESC
     C                   MOVEL     INELIGIBLE    ELIGIBLE
     C                   MOVEL     INUSRPRF      EXHUSRPRF
     C                   MOVEL     INEXHBID      EXHBDBID
     C                   WRITE     EXHBREC
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C*------------------------------------------------------------------------
     C     CHKPARM       BEGSR
     C                   ENDSR

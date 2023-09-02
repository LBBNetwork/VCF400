     FEXHBDB    IF   E           K DISK
     FEXHBMENUSCCF   E             WORKSTN
     DUSERPROF         S              9A
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH            9
     C*-----------------------------------------------------------------------
     C*                  MOVEL     LAUNCH        PARMOUT
     C                   EXSR      CHKPARM
     C                   EXFMT     MENU
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C*------------------------------------------------------------------------
     C     CHKPARM       BEGSR
     C                   MOVEL     LAUNCH        USERPROF
     C     USERPROF      SETLL     EXHBREC
     C                   READ      EXHBDB
     C                   MOVEL     EXHBTITLE     OUTTITLE
     C                   MOVEL     EXHBITOR      OUTNAME
     C                   MOVEL     EXHBCITY      OUTCITY
     C                   MOVEL     EXHBSTATE     OUTSTATE
     C                   MOVEL     EXHBDESC      OUTDESC
     C                   ENDSR

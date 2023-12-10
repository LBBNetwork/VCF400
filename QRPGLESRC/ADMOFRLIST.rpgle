     FSECOFRS   UF A E           K DISK
     FADMSCR    CF   E             WORKSTN
     DCHECKOK          S              1P 0
     DSTSOK            C                   CONST('Status updated')
     C*----------------------------------------------------
     C                   EXFMT     ADDADM
     C
     C                   READ      SECOFRS
     C     *LOVAL        SETLL     USRPROFR

     C                   MOVEL     INADMNAME     USERPROF
     C                   WRITE     USRPROFR
     C
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C*----------------------------------------------------

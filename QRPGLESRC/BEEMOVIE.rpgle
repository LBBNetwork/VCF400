     FBMOVDB    IF   E           K DISK
     FBMOVSCR   CF   E             WORKSTN
     F                                     SFILE(SFLDATA:RRN#)
     D RRN#            S              4S 0
     C
     C                   EXSR      CLEARSR
     C                   EXSR      LOADSR
     C                   EXFMT     SFLCTL
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C*--------------------------------------------------------
     C     CLEARSR       BEGSR
     C                   EVAL      *IN50 = *OFF
     C                   WRITE     SFLCTL
     C                   EVAL      *IN50 = *ON
     C                   ENDSR
     C*--------------------------------------------------------
     C     LOADSR        BEGSR
     C     *LOVAL        SETLL     BMOVDB
     C                   READ      BMOVDB
     C
     C                   DOU       %EOF(BMOVDB)
     C                   EVAL      RRN# = RRN# + 1
     C                   WRITE     SFLDATA
     C                   READ      BMOVDB
     C                   ENDDO
     C
     C                   ENDSR

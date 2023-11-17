     FLRN400STR IF   E           K DISK
     FLRN400SCR CF   E             WORKSTN
     DCURPAGENBR       S              4P 0
     DALWFWD           S              1P 0
     C*---------------------------------------------------------------------
     C*    *ENTRY        PLIST
     C*                  PARM                    LAUNCH            9
     C*-----------------------------------------------------------------------
     C                   MOVEL     1             ALWFWD
     C
     C                   READ      LRN400STR
     C                   MOVEL     PAGENBR       CURPAGENBR
     C                   MOVEL     CONTENT       OUTCONTENT
     C                   MOVEL     PAGENBR       OUTPAGENBR
     C
     C                   DOW       *IN03 = *OFF
     C
     C                   IF        *IN05 = *ON
     C                   EXSR      PAGEFWD
     C                   EVAL      *IN05 = *OFF
     C                   ENDIF
     C
     C                   IF        *IN08 = *ON
     C                   EXSR      PAGEBACK
     C                   EVAL      *IN08 = *OFF
     C                   ENDIF
     C
     C                   EXFMT     MAIN
     C                   ENDDO
     C
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C*---------------------------------------------------------------------
     C     PAGEFWD       BEGSR
     C                   CLEAR                   OUTCONTENT
     C                   IF        ALWFWD = 1
     C                   ADD       1             CURPAGENBR
     C                   ENDIF
     C
     C     CURPAGENBR    CHAIN     LRN400RCD                          95
     C                   IF        *IN95 = *OFF
     C                   READE     LRN400STR
     C                   MOVEL     PAGENBR       OUTPAGENBR
     C                   MOVEL     CONTENT       OUTCONTENT
     C                   ELSE
     C                   MOVEL     0             ALWFWD
     C                   ENDIF
     C                   ENDSR
     C*------------------------------------------------------------------------
     C     PAGEBACK      BEGSR
     C                   IF        CURPAGENBR = 0
     C
     C                   ELSE
     C                   SUB       1             CURPAGENBR
     C                   ENDIF
     C
     C                   CLEAR                   OUTCONTENT
     C     CURPAGENBR    CHAIN     LRN400RCD                          96
     C                   READE     LRN400STR
     C                   MOVEL     PAGENBR       OUTPAGENBR
     C                   MOVEL     CONTENT       OUTCONTENT
     C                   MOVEL     1             ALWFWD
     C                   ENDSR
     C*------------------------------------------------------------------------
     C     CHKPARM       BEGSR
     C*                  MOVEL     LAUNCH        PAGEJMP
     C                   ENDSR

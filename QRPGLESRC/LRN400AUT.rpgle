     FLRN400STR IF   E           K DISK
     FLRNAUTO   CF   E             WORKSTN MAXDEV(*FILE)
     DCURPAGENBR       S              4P 0
     DFRMPAGENBR       S              4P 0
     DPAGEACTION       S              1P 0
     DALWFWD           S              1P 0
     C*---------------------------------------------------------------------
     C                   MOVEL     1             ALWFWD
     C                   MOVEL     0             PAGEACTION
     C
     C                   READ      LRN400STR
     C                   MOVEL     PAGENBR       CURPAGENBR
     C                   MOVEL     CONTENT       OUTCONTENT
     C                   MOVEL     PAGENBR       OUTPAGENBR
     C
     C                   DOU       *IN03 = *ON
     C*                  EXFMT     MAIN
     C                   WRITE     MAIN
     C                   READ      LRNAUTO                              69
     C                   EXSR      PAGEFWD
     C                   ENDDO
     C
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C*---------------------------------------------------------------------
     C     PARSESCRIPT   BEGSR
     C                   IF        EXTRA   = 'END'
     C                   MOVEL     1             PAGEACTION
     C                   ENDIF
     C
     C*                  IF        OUTCONTENT = 'CALL'
     C*                  MOVEL     2             PAGEACTION
     C*                  ENDIF
     C
     C*                  IF        OUTCONTENT = 'JUMP'
     C*                  MOVEL     3             PAGEACTION
     C*                  ENDIF
     C                   ENDSR
     C*---------------------------------------------------------------------
     C     PRFRMACTN     BEGSR
     C                   IF        PAGEACTION = 0
     C                   LEAVESR
     C                   ENDIF
     C
     C                   IF        PAGEACTION = 1
     C*                  MOVEL     *ON           *INLR
     C*                  RETURN
     C                   EVAL      CURPAGENBR = 0
     C                   EVAL      PAGEACTION = 0
     C                   ENDIF
     C
     C                   ENDSR
     C*---------------------------------------------------------------------
     C     PAGEFWD       BEGSR
     C                   CLEAR                   OUTCONTENT
     C                   IF        ALWFWD = 1
     C                   ADD       1             CURPAGENBR
     C                   MOVEL     0             FRMPAGENBR
     C                   ENDIF
     C
     C     CURPAGENBR    CHAIN     LRN400RCD                          95
     C                   IF        *IN95 = *OFF
     C                   READE     LRN400STR
     C                   MOVEL     PAGENBR       OUTPAGENBR
     C                   MOVEL     CONTENT       OUTCONTENT
     C                   EXSR      PARSESCRIPT
     C                   EXSR      PRFRMACTN
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
     C                   IF        FRMPAGENBR = 0
     C     CURPAGENBR    CHAIN     LRN400RCD
     C                   ELSE
     C     FRMPAGENBR    CHAIN     LRN400RCD
     C                   ENDIF
     C                   READE     LRN400STR
     C                   MOVEL     PAGENBR       OUTPAGENBR
     C                   MOVEL     CONTENT       OUTCONTENT
     C                   MOVEL     1             ALWFWD
     C                   MOVEL     0             FRMPAGENBR
     C                   ENDSR
     C*------------------------------------------------------------------------

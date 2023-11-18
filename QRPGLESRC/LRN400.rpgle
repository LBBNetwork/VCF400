     FLRN400STR IF   E           K DISK
     FLRN400SCR CF   E             WORKSTN
     DCURPAGENBR       S              4P 0
     DFRMPAGENBR       S              4P 0
     DPAGEACTION       S              1P 0
     DALWFWD           S              1P 0
     C*---------------------------------------------------------------------
     C*    *ENTRY        PLIST
     C*                  PARM                    LAUNCH            9
     C*-----------------------------------------------------------------------
     C                   MOVEL     1             ALWFWD
     C                   MOVEL     0             PAGEACTION
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
     C     PARSESCRIPT   BEGSR
     C                   IF        EXTRA   = 'END'
     C                   MOVEL     1             PAGEACTION
     C                   ENDIF
     C
     C                   IF        OUTCONTENT = 'CALL'
     C                   MOVEL     2             PAGEACTION
     C                   ENDIF
     C
     C                   IF        OUTCONTENT = 'JUMP'
     C                   MOVEL     3             PAGEACTION
     C                   ENDIF
     C                   ENDSR
     C*---------------------------------------------------------------------
     C     PRFRMACTN     BEGSR
     C                   IF        PAGEACTION = 0
     C                   LEAVESR
     C                   ENDIF
     C
     C                   IF        PAGEACTION = 1
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C                   ENDIF
     C
     C                   IF        PAGEACTION = 2
     C                   CALL      EXTRA
     C                   EXSR      JUMPTO
     C                   MOVEL     0             PAGEACTION
     C                   ENDIF
     C
     C                   IF        PAGEACTION = 3
     C                   EXSR      JUMPTO
     C                   MOVEL     0             PAGEACTION
     C                   ENDIF
     C                   ENDSR
     C*---------------------------------------------------------------------
     C     JUMPTO        BEGSR
     C                   IF        PAGEACTION = 2
     C                   MOVEL     CURPAGENBR    FRMPAGENBR
     C                   SUB       1             FRMPAGENBR
     C                   ADD       1             CURPAGENBR
     C                   ENDIF
     C
     C                   IF        PAGEACTION = 3
     C                   MOVEL     CURPAGENBR    FRMPAGENBR
     C                   SUB       1             FRMPAGENBR
     C                   MOVEL     EXTRA         CURPAGENBR
     C                   ENDIF
     C
     C     CURPAGENBR    CHAIN     LRN400RCD
     C                   READE     LRN400STR
     C                   MOVEL     PAGENBR       OUTPAGENBR
     C                   MOVEL     CONTENT       OUTCONTENT
     C                   MOVEL     1             ALWFWD
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
     C     CHKPARM       BEGSR
     C*                  MOVEL     LAUNCH        PAGEJMP
     C                   ENDSR

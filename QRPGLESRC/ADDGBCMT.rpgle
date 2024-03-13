     FGUESTBKDB UF A E           K DISK
     FEXHBDB    IF   E           K DISK
     FGUESTBKSCRCF   E             WORKSTN
     DID               S              4P 0
     DALWEXIT          S              1P 0
     DVALIDATE         S              1P 0
     DUSERPRF          S              9A
     DSUCCESS          C                   CONST('Thanks for commenting')
     DVISYES           C                   CONST('Y')
     DERREXID          C                   CONST('Must enter Exhibit ID')
     DERRNOCMT         C                   CONST('Must enter a comment')
     DERREXIST         C                   CONST('Exhibit not found')
     DERRNONAME        C                   CONST('Must enter your name    ')
     C*-----------------------------------------------
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH           20
     C*-----------------------------------------------
     C                   MOVEL     0             ALWEXIT
     C
     C                   DOW       ALWEXIT = *ZERO
     C                   MOVEL     0             VALIDATE
     C
     C                   EXSR      CHKPARM
     C                   EXFMT     ADDCMT
     C*
     C                   IF        INID     = *BLANK
     C                   EVAL      ERRLINE = ERREXID
     C                   EVAL      *IN40 = *ON
     C                   ELSE
     C                   ADD       1             VALIDATE
     C                   ENDIF
     C*
     C                   IF        INNAME = *BLANK
     C                   EVAL      ERRLINE = ERRNONAME
     C                   EVAL      *IN41 = *ON
     C                   ELSE
     C                   ADD       1             VALIDATE
     C                   ENDIF
     C
     C                   IF        INCMT = *BLANK
     C                   EVAL      ERRLINE = ERRNOCMT
     C                   EVAL      *IN42 = *ON
     C                   ELSE
     C                   ADD       1             VALIDATE
     C                   ENDIF
     C
     C                   EVAL      *IN05 = *OFF
     C
     C                   IF        VALIDATE = 3
     C                   MOVEL     1             ALWEXIT
     C                   ENDIF
     C*
     C                   IF        *IN12 = *ON
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C                   ENDIF
     C*
     C                   ENDDO
     C                   EXSR      ADDTODB
     C*----------------------------------------------------
     C     ADDTODB       BEGSR
     C                   MOVEL     0             ID
     C                   EVAL      *IN05 = *OFF
     C                   READ      GUESTBKDB                              90
     C     *IN90         DOWEQ     *OFF
     C                   READ      GUESTBKDB                              90
     C                   ENDDO
     C                   MOVEL     CMTID         ID
     C                   ADD       1             ID
     C                   MOVEL     ID            CMTID
     C                   MOVEL     INNAME        GUESTNAME
     C                   MOVEL     INID          EXHBID
     C                   MOVEL     INCMT         GUESTCMT
     C                   MOVEL     VISYES        VISIBLE
     C                   WRITE     GUESTBKRCD
     C                   CALL      'PRTLSTCMT'
     C                   EXFMT     ENDCMT
     C                   EXSR      ENDADDGB
     C                   ENDSR
     C*-------------------------------------------------------
     C     CHKPARM       BEGSR
     C                   MOVEL     LAUNCH        USERPRF
     C                   IF        USERPRF = 'MM2024'
     C
     C                   ELSE
     C                   MOVEL     USERPRF       INID
     C                   MOVEL     *ON           *IN70
     C                   ENDIF
     C                   ENDSR
     C*-------------------------------------------------------
     C     ENDADDGB      BEGSR
     C*                  EXFMT     VOTEEND
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C                   ENDSR

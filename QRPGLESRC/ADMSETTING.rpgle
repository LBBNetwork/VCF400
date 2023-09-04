     FGUESTBKDB UF A E           K DISK
     FEXHBDB    IF   E           K DISK
     FGUESTBKSCRCF   E             WORKSTN
     DID               S              4P 0
     DSUCCESS          C                   CONST('Thanks for commenting')
     DERREXID          C                   CONST('Must enter Exhibit ID')
     DERRNOCMT         C                   Const('Must enter a comment')
     C*-----------------------------------------------
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH           20
     C*-----------------------------------------------
     C                   DOW       *IN05 = *OFF
     C                   EXSR      CHKPARM
     C                   EXFMT     ADDCMT
     C*
     C                   IF        INEXHBID = *BLANK
     C                   EVAL      ERRLINE = ERREXID
     C                   EVAL      *IN05 = *OFF
     C                   ENDIF
     C*
     C                   IF        INCMT = *BLANK
     C                   EVAL      ERRLINE = ERRNOCMT
     C                   EVAL      *IN05 = *OFF
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
     C                   MOVEL     INEXHBID      EXHBID
     C                   MOVEL     INCMT         GUESTCMT
     C                   WRITE     GUESTBKRCD
     C                   EXSR      ENDADDGB
     C                   ENDSR
     C*-------------------------------------------------------
     C     CHKPARM       BEGSR
     C                   MOVEL     LAUNCH        DBGPARM
     C*    LAUNCH        SETLL     EXHBREC                                91
     C*                  READ      EXHBDB
     C*                  MOVEL     DBGEX         EXHBTITLE
     C                   ENDSR
     C*-------------------------------------------------------
     C     ENDADDGB      BEGSR
     C*                  EXFMT     VOTEEND
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C                   ENDSR

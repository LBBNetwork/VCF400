     FGUESTBKDB UF A E           K DISK
     FGUESTBKSCRCF   E             WORKSTN
     DID               S              4P 0
     DHIDEY            C                   CONST('Y')
     DHIDEN            C                   CONST('N')
     DERRCMTID         C                   CONST('Must enter CommentID')
     DERRYN            C                   CONST('Type Y or N')
     DSTSOK            C                   CONST('Status updated')
     C*-----------------------------------------------
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH           20
     C*-----------------------------------------------
     C                   EXSR      CHKPARM
     C                   EXSR      READDB
     C                   DOW       *IN05 = *OFF
     C                   EXFMT     HIDECMT
     C*
     C                   IF        *IN12 = *ON
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C                   ENDIF
     C*
     C                   ENDDO
     C                   EXSR      HIDECMTSR
     C                   MOVEL     STSOK         ERRLINE
     C*----------------------------------------------------
     C     READDB        BEGSR
     C                   EVAL      *IN05 = *OFF
     C     ID            SETLL     GUESTBKRCD
     C                   READ      GUESTBKDB
     C                   MOVEL     ID            HIDECMTID
     C                   MOVEL     GUESTNAME     OUTNAME
     C                   MOVEL     GUESTCMT      OUTCMT
     C                   MOVEL     VISIBLE       CURRHIDE
     C                   ENDSR
     C*-------------------------------------------------------
     C     HIDECMTSR     BEGSR
     C                   EVAL      *IN05 = *OFF
     C*
     C                   IF        INHIDEYN = 'Y'
     C                   MOVEL     HIDEY         VISIBLE
     C                   UPDATE    GUESTBKRCD
     C                   ENDIF
     C*
     C                   IF        INHIDEYN = 'N'
     C                   MOVEL     HIDEN         VISIBLE
     C                   UPDATE    GUESTBKRCD
     C                   ENDIF
     C*
     C                   ENDSR
     C*-------------------------------------------------------
     C     CHKPARM       BEGSR
     C                   MOVEL     LAUNCH        ID
     C                   ENDSR

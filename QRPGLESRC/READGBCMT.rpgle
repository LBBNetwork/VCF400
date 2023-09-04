     FGUESTBKDB UF A E           K DISK
     FEXHBDB    IF   E           K DISK
     FGUESTBKSCRCF   E             WORKSTN
     DID               S              4P 0
     DERRCMTID         C                   CONST('Must enter CommentID')
     DERRHNAME         C                   CONST('Name Hidden')
     DERRHCMT          C                   CONST('Sorry, this comment has been-
     D                                            hidden by an admin.')
     C*-----------------------------------------------
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH           20
     C*-----------------------------------------------
     C                   EXSR      CHKPARM
     C                   DOW       *IN05 = *OFF
     C                   EXSR      GETTLCMT
     C                   EXFMT     READCMT
     C*
     C                   IF        INCMTID  = *ZERO
     C                   EVAL      ERRLINE = ERRCMTID
     C                   ENDIF
     C                   IF        *IN12 = *ON
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C                   ENDIF
     C*
     C                   ENDDO
     C                   EXSR      READDB
     C*----------------------------------------------------
     C     READDB        BEGSR
     C                   EVAL      *IN05 = *OFF
     C     INCMTID       SETLL     GUESTBKRCD
     C                   READ      GUESTBKDB
     C                   IF        VISIBLE = 'N'
     C                   MOVEL     ERRHNAME      OUTNAME
     C                   MOVEL     ERRHCMT       OUTCMT
     C                   ELSE
     C                   MOVEL     GUESTNAME     OUTNAME
     C                   MOVEL     GUESTCMT      OUTCMT
     C                   ENDIF
     C                   ENDSR
     C*-------------------------------------------------------
     C     GETTLCMT      BEGSR
     C                   READ      GUESTBKDB                              92
     C     *IN92         DOWEQ     *OFF
     C                   READ      GUESTBKDB                              92
     C                   ENDDO
     C*                  EVAL      WTFCMTNUM = CMTID
     C                   MOVEL     CMTID         WTFCMTNUM
     C                   ENDSR
     C*-------------------------------------------------------
     C     CHKPARM       BEGSR
     C*    LAUNCH        SETLL     EXHBREC                                91
     C*                  READ      EXHBDB
     C*                  MOVEL     DBGEX         EXHBTITLE
     C                   ENDSR

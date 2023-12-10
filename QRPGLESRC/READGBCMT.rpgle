     FGUESTBKDB UF A E           K DISK
     FEXHBDB    IF   E           K DISK
     FGUESTBKSCRCF   E             WORKSTN
     DID               S              4P 0
     DUSERPRF          S              9A
     DERRCMTID         C                   CONST('Must enter CommentID')
     DERRHNAME         C                   CONST('Name Hidden')
     DERRPNAME         C                   CONST('Private Comment')
     DERREXIST         C                   CONST('Exhibit not found')
     DERRHCMT          C                   CONST('This comment hidden by an +
     D                                            admin - offensive content.')
     DERRPRIV          C                   CONST('This comment is not part of +
     D                                            this guestbook.             ')
     DBLNK             C                   CONST('                         -
     D                                                                    ')
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
     C                   IF        EXHBID = USERPRF OR USERPRF = 'MM2024'
     C                   MOVEL     GUESTNAME     OUTNAME
     C                   MOVEL     GUESTCMT      OUTCMT
     C     EXHBID        SETLL     EXHBREC
     C                   READ      EXHBDB
     C                   MOVEL     EXHBTITLE     OUTTITLE
     C                   ELSE
     C                   MOVEL     ERRPRIV       OUTCMT
     C                   MOVEL     BLNK          OUTNAME
     C                   MOVEL     BLNK          OUTTITLE
     C                   ENDIF
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
     C                   MOVEL     LAUNCH        USERPRF
     C                   EVAL      ERRLINE = USERPRF
     C                   ENDSR

     FGUESTBKDB IF   E           K DISK
     FTESTPRT2  O    E             PRINTER OFLIND(*IN01)
     DID               S              4P 0
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH            4
     C
     C                   MOVEL     LAUNCH        ID
     C
     C
     C                   WRITE     RCD001
     C
     C     ID            SETLL     GUESTBKDB
     C                   READ      GUESTBKDB
     C
     C                   WRITE     RCD002
     C                   WRITE     RCD003
     C                   WRITE     CMTDETAIL
     C
     C                   MOVEL     *ON           *INLR
     C                   RETURN

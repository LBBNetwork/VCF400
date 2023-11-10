     FGUESTBKDB IF   E           K DISK
     FCMTPRTF   O    E             PRINTER OFLIND(*IN01)
     C                   WRITE     RCD001
     C
     C     *LOVAL        SETLL     GUESTBKDB
     C                   READ      GUESTBKDB
     C
     C                   DOU       %EOF(GUESTBKDB)
     C                   READ      GUESTBKDB
     C                   ENDDO
     C
     C                   WRITE     RCD002
     C                   WRITE     RCD003
     C                   WRITE     CMTNBR
     C                   WRITE     CMTDETAIL
     C
     C                   MOVEL     *ON           *INLR
     C                   RETURN

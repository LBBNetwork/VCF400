     FGUESTBKDB IF   E           K DISK
     FCMTTST    O    E             PRINTER OFLIND(*IN01)
     DID               S              4P 0
     DCOMMAND          S             10A
     C                   EVAL      COMMAND = X'1B40'
     C                   EXCEPT    INITP
     C
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
     C                   EVAL      PRTCMD  = X'1D56'
     C                   EXCEPT    INITP
     C
     C                   MOVEL     *ON           *INLR
     C                   RETURN

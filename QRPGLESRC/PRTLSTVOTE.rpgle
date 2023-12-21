     FVOTINGDB  IF   E           K DISK
     FVOTEPRTF  O    E             PRINTER OFLIND(*IN01)
     DID               S              4P 0
     C                   WRITE     RCD001
     C
     C     *LOVAL        SETLL     VOTINGDB
     C                   READ      VOTINGDB
     C
     C                   DOU       %EOF(VOTINGDB)
     C                   READ      VOTINGDB
     C                   ENDDO
     C
     C                   WRITE     RCD002
     C                   WRITE     RCD003
     C                   WRITE     EXHBOUT
     C
     C                   MOVEL     *ON           *INLR
     C                   RETURN

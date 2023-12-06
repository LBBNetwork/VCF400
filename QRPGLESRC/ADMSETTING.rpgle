     FSETTINGS  IF   E           K DISK
     FGUESTBKSCRCF   E             WORKSTN
     C*-----------------------------------------------
     C                   EXFMT     ADDCMT
     C                   EXSR      ADDTODB
     C*----------------------------------------------------
     C     ADDTODB       BEGSR
     C                   MOVEL     INCMT         GUESTCMT
     C                   WRITE     GUESTBKRCD
     C                   EXSR      ENDADD
     C                   ENDSR
     C*-------------------------------------------------------
     C     ENDADD        BEGSR
     C*                  EXFMT     VOTEEND
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C                   ENDSR

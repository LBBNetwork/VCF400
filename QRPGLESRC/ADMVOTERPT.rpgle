     FSECOFRS   IF   E           K DISK
     FVOTINGDB  IF   E           K DISK
     FEXHBDB    IF   E           K DISK
     FADMVOTERESCF   E             WORKSTN
     DNUMBR            S              4P 0
     DVOTEEFA          S              4P 0
     DVOTEBIS          S              4P 0
     DUSERPROF         S              9A
     DERRBLANK         C                   CONST('USRPRF cannot be blank     ')
     DDBGNAME          C                   CONST('NL2024')
      *---------------------------------------------------------------------
      * AWARDNBR:
      * 001 = VOTEEFA (Ed Fair)
      * 002 = VOTEBIS (Best in Show)
      *---------------------------------------------------------------------
     C*---------------------------------------------------------------------
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH            9
     C*-----------------------------------------------------------------------
     C                   EXSR      CHKPARM
     C*                  EXFMT     VOTERES
     C
     C     *LOVAL        SETLL     VOTINGREC
     C                   READ      VOTINGREC                            90
     C
     C                   DOU       %EOF(VOTINGDB)
     C
     C                   IF        USERPROF = EXHBNBR
     C                   IF        AWARDNBR =  1
     C                   ADD       1             VOTEEFA
     C                   ENDIF
     C
     C                   IF        AWARDNBR =  2
     C                   ADD       1             VOTEBIS
     C                   ENDIF
     C                   ENDIF
     C
     C                   ADD       1             NUMBR
     C                   READ      VOTINGREC
     C
     C                   ENDDO
     C
     C                   MOVEL     NUMBR         ERRLINE
     C                   MOVEL     VOTEEFA       OUTEFA
     C                   MOVEL     VOTEBIS       OUTBIS
     C
     C                   EXFMT     VOTERES
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C*---------------------------------------------------------------------
     C     CHKOFRS       BEGSR
     C                   ENDSR
     C*------------------------------------------------------------------------
     C     CHKPARM       BEGSR
     C                   MOVEL     LAUNCH        USERPROF
     C*                  MOVEL     EXHIBIT       EDTEXHB
     C*TODO HERE: Logic to do the stuff to validate user is
     C*a SECOFR in the SECOFRS file
     C                   ENDSR

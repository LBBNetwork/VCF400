     FSECOFRS   IF   E           K DISK
     FVOTINGDB  IF   E           K DISK
     FEXHBDB    IF   E           K DISK
     FADMVOTERESCF   E             WORKSTN
     DALWEXIT          S              1P 0
     DNUMBR            S              4P 0
     DVOTEEFA          S              4P 0
     DVOTEBIS          S              4P 0
     DUSERPROF         S              9A
     DERRBLANK         C                   CONST('USRPRF cannot be blank     ')
     DERRNOTF          C                   CONST('USRPRF was not found       ')
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
     C                   MOVEL     0             ALWEXIT
     C
     C                   IF        USERPROF = 'NONE'
     C
     C                   ELSE
     C                   EXSR      READVOTE
     C                   ENDIF
     C
     C                   DOW       ALWEXIT = *ZERO
     C                   EXFMT     VOTERES
     C
     C                   IF        *IN03 = *ON
     C                   MOVEL     1             ALWEXIT
     C                   ENDIF
     C
     C                   MOVEL     INUSRPRF      USERPROF
     C                   EXSR      READVOTE
     C                   ENDDO
     C
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C*-----------------------------------------------------------------------
     C     READVOTE      BEGSR
     C                   RESET                   VOTEEFA
     C                   RESET                   VOTEBIS
     C                   RESET                   NUMBR
     C
     C     *LOVAL        SETLL     VOTINGREC                          90
     C                   READ      VOTINGREC
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
     C     USERPROF      CHAIN     EXHBREC                            91
     C                   IF        *IN91 = *OFF
     C                   READE     EXHBDB
     C                   MOVEL     EXHBTITLE     OUTTITLE
     C                   ELSE
     C                   EVAL      OUTTITLE = ERRNOTF
     C                   ENDIF
     C
     C                   MOVEL     NUMBR         OUTVOTEN
     C                   MOVEL     VOTEEFA       OUTEFA
     C                   MOVEL     VOTEBIS       OUTBIS
     C                   MOVEL     USERPROF      INUSRPRF
     C*                  MOVEL     EXHBTITLE     OUTTITLE
     C
     C                   ENDSR
     C*------------------------------------------------------------------------
     C     CHKOFRS       BEGSR
     C                   ENDSR
     C*------------------------------------------------------------------------
     C     CHKPARM       BEGSR
     C                   MOVEL     LAUNCH        USERPROF
     C*                  MOVEL     EXHIBIT       EDTEXHB
     C*TODO HERE: Logic to do the stuff to validate user is
     C*a SECOFR in the SECOFRS file
     C                   ENDSR

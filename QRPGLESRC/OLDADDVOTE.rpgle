     FVOTINGDB  UF A E           K DISK
     FEXHBDB    IF   E           K DISK
     FAWARDDB   IF   E           K DISK
     FVOTESCR   CF   E             WORKSTN
     DCHECKOK          S              1P 0
     DSUCCESS          C                   CONST('You have voted successfully')
     DERRBLKBG         C                   CONST('Must enter badge number')
     DERRBLKEX         C                   CONST('Must enter Exhibit ID')
     DERRBLKAW         C                   CONST('Must enter Award ID')
     DERREXIST         C                   CONST('You have already voted.')
     DERRENTER         C                   CONST('Use F5 key to submit')
     DERRPROHB         C                   CONST('Exhibit ineligible for award')
     DERRNOEXB         C                   CONST('Exhibit does not exist')
     DERRNOAWD         C                   CONST('Award does not exist.')
     C*-----------------------------------------------
     C                   DOW       *IN05 = *OFF
     C                   EXFMT     VOTE1
     C*
     C                   IF        INPUTBADGE = *ZERO
     C                   EVAL      ERRLINE = ERRBLKBG
     C                   EVAL      *IN05 = *OFF
     C                   ENDIF
     C*
     C                   IF        INPUTAWARD = *ZERO
     C                   EVAL      ERRLINE = ERRBLKAW
     C                   EVAL      *IN05 = *OFF
     C                   ENDIF
     C*
     C                   IF        INPUTEXHB = *ZERO
     C                   EVAL      ERRLINE = ERRBLKEX
     C                   EVAL      *IN05 = *OFF
     C                   ENDIF
     C*
     C                   IF        *IN12 = *ON
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C                   ENDIF
     C*
     C                   ENDDO
     C                   EXSR      ADDTODB
     C*----------------------------------------------------
     C     ADDTODB       BEGSR
     C                   MOVEL     0             CHECKOK
     C                   EVAL      *IN05 = *OFF
     C     INPUTBADGE    CHAIN     VOTINGREC                          95
     C                   IF        *IN95 = *OFF
     C                   EVAL      ERRLINE = ERREXIST
     C                   ENDIF
     C                   READ      VOTINGDB                               90
     C     INPUTEXHB     SETLL     EXHBREC
     C                   READ      EXHBDB
     C*
     C                   IF        ELIGIBLE = 0
     C                   EVAL      ERRLINE = ERRPROHB
     C                   ELSE
     C                   ADD       1             CHECKOK
     C                   ENDIF
     C*
     C     INPUTEXHB     CHAIN     EXHBREC                            93
     C                   IF        *IN93 = *OFF
     C                   ADD       1             CHECKOK
     C                   ELSE
     C                   EVAL      ERRLINE = ERRNOEXB
     C                   ENDIF
     C*
     C     INPUTAWARD    CHAIN     AWARDRCD                           94
     C                   IF        *IN94 = *OFF
     C                   ADD       1             CHECKOK
     C                   ELSE
     C                   EVAL      ERRLINE = ERRNOAWD
     C                   ENDIF
     C*
     C                   IF        CHECKOK = 3
     C                   MOVEL     INPUTBADGE    BADGENBR
     C                   MOVEL     INPUTAWARD    AWARDNBR
     C                   MOVEL     INPUTEXHB     EXHBNBR
     C                   WRITE     VOTINGREC
     C                   EXSR      ENDVOTE
     C                   ENDIF
     C                   ENDSR
     C*-------------------------------------------------------
     C     CHKPARM       BEGSR
     C*                  TODO! Validate passed launch parms
     C                   ENDSR
     C*-------------------------------------------------------
     C     ENDVOTE       BEGSR
     C                   EXFMT     VOTEEND
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C                   ENDSR

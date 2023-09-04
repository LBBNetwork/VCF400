     FVOTINGDB  UF A E             DISK
     FVOTESCR   CF   E             WORKSTN
     DSUCCESS          C                   CONST('You have voted successfully')
     DERRBLANK         C                   CONST('Must fill out all fields')
     DERREXIST         C                   CONST('You have already voted.')
     C                   EXFMT     VOTE1
     C                   IF        INPUTBADGE = *ZERO
     C                   EVAL      ERRLINE = ERRBLANK
     C*                  MOVE      *ON           *INLR
     C*                  RETURN
     C                   ENDIF
     C                   READ      VOTINGDB                               90
     C                   MOVEL     INPUTBADGE    BADGENBR
     C                   MOVEL     INPUTAWARD    AWARDNBR
     C                   MOVEL     INPUTEXHB     EXHBNBR
     C                   WRITE     VOTINGREC
     C                   MOVE      *ON           *INLR
     C                   RETURN

/PROG  ULTRASONIC
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "repeatability";
PROG_SIZE	= 2506;
CREATE		= DATE 20-04-09  TIME 01:50:50;
MODIFIED	= DATE 20-04-09  TIME 03:46:14;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 130;
MEMORY_SIZE	= 3042;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  CALL ZERO    ;
   2:  R[30]=0    ;
   3:  R[31]=0    ;
   4:   ;
   5:  LBL[1] ;
   6:  R[30]=R[30]+1    ;
   7:  !approach ;
   8:  UTOOL_NUM=4 ;
   9:L PR[10] 100mm/sec FINE    ;
  10:   ;
  11:   ;
  12:  !probe 1 ;
  13:  R[31]=11    ;
  14:  UTOOL_NUM=1 ;
  15:L PR[11] 100mm/sec FINE    ;
  16:  R[6]=1    ;
  17:  JMP LBL[2] ;
  18:  LBL[3] ;
  19:  CALL UIT502USSTOMM    ;
  20:  CALL LOGREG(R[31],SR[1],R[6],R[4],R[7]) ;
  21:  UTOOL_NUM=2 ;
  22:L PR[11] 100mm/sec FINE    ;
  23:  R[6]=2    ;
  24:  JMP LBL[2] ;
  25:  LBL[4] ;
  26:  CALL UIT508USSTOMM    ;
  27:  CALL LOGREG(R[31],SR[1],R[6],R[4],R[7]) ;
  28:  UTOOL_NUM=3 ;
  29:L PR[11] 100mm/sec FINE    ;
  30:  R[6]=3    ;
  31:  JMP LBL[2] ;
  32:  LBL[5] ;
  33:  CALL UBUSSTOMM    ;
  34:  CALL LOGREG(R[31],SR[1],R[6],R[4],R[7]) ;
  35:   ;
  36:  !probe 2 ;
  37:  R[31]=12    ;
  38:  UTOOL_NUM=1 ;
  39:L PR[12] 100mm/sec FINE    ;
  40:  R[6]=1    ;
  41:  JMP LBL[2] ;
  42:  LBL[6] ;
  43:  CALL UIT502USSTOMM    ;
  44:  CALL LOGREG(R[31],SR[1],R[6],R[4],R[7]) ;
  45:  UTOOL_NUM=2 ;
  46:L PR[12] 100mm/sec FINE    ;
  47:  R[6]=2    ;
  48:  JMP LBL[2] ;
  49:  LBL[7] ;
  50:  CALL UIT508USSTOMM    ;
  51:  CALL LOGREG(R[31],SR[1],R[6],R[4],R[7]) ;
  52:  UTOOL_NUM=3 ;
  53:L PR[12] 100mm/sec FINE    ;
  54:  R[6]=3    ;
  55:  JMP LBL[2] ;
  56:  LBL[8] ;
  57:  CALL UBUSSTOMM    ;
  58:  CALL LOGREG(R[31],SR[1],R[6],R[4],R[7]) ;
  59:   ;
  60:  !probe 3 ;
  61:  R[31]=13    ;
  62:  UTOOL_NUM=1 ;
  63:L PR[13] 100mm/sec FINE    ;
  64:  R[6]=1    ;
  65:  JMP LBL[2] ;
  66:  LBL[9] ;
  67:  CALL UIT502USSTOMM    ;
  68:  CALL LOGREG(R[31],SR[1],R[6],R[4],R[7]) ;
  69:  UTOOL_NUM=2 ;
  70:L PR[13] 100mm/sec FINE    ;
  71:  R[6]=2    ;
  72:  JMP LBL[2] ;
  73:  LBL[10] ;
  74:  CALL UIT508USSTOMM    ;
  75:  CALL LOGREG(R[31],SR[1],R[6],R[4],R[7]) ;
  76:  UTOOL_NUM=3 ;
  77:L PR[13] 100mm/sec FINE    ;
  78:  R[6]=3    ;
  79:  JMP LBL[2] ;
  80:  LBL[11] ;
  81:  CALL UBUSSTOMM    ;
  82:  CALL LOGREG(R[31],SR[1],R[6],R[4],R[7]) ;
  83:   ;
  84:  IF R[7]=5000,JMP LBL[999] ;
  85:  JMP LBL[1] ;
  86:   ;
  87:  LBL[2] ;
  88:  !turn on active USS ;
  89:  IF (R[6]=1) THEN ;
  90:  !kill uss 2 & 3 pwr ;
  91:  DO[33]=ON ;
  92:  DO[35]=OFF ;
  93:  DO[37]=OFF ;
  94:  ELSE ;
  95:  IF (R[6]=2) THEN ;
  96:  !kill uss 1 & 3 pwr ;
  97:  DO[33]=OFF ;
  98:  DO[35]=ON ;
  99:  DO[37]=OFF ;
 100:  ELSE ;
 101:  IF (R[6]=3) THEN ;
 102:  !kill uss 1 & 2 pwr ;
 103:  DO[33]=OFF ;
 104:  DO[35]=OFF ;
 105:  DO[37]=ON ;
 106:  ENDIF ;
 107:  ENDIF ;
 108:  ENDIF ;
 109:  !go back to OG label ;
 110:  IF R[31]=11 AND R[6]=1,JMP LBL[3] ;
 111:  IF R[31]=11 AND R[6]=2,JMP LBL[4] ;
 112:  IF R[31]=11 AND R[6]=3,JMP LBL[5] ;
 113:  IF R[31]=12 AND R[6]=1,JMP LBL[6] ;
 114:  IF R[31]=12 AND R[6]=2,JMP LBL[7] ;
 115:  IF R[31]=12 AND R[6]=3,JMP LBL[8] ;
 116:  IF R[31]=13 AND R[6]=1,JMP LBL[9] ;
 117:  IF R[31]=13 AND R[6]=2,JMP LBL[10] ;
 118:  IF R[31]=13 AND R[6]=3,JMP LBL[11] ;
 119:   ;
 120:   ;
 121:   ;
 122:   ;
 123:   ;
 124:   ;
 125:   ;
 126:   ;
 127:   ;
 128:   ;
 129:  LBL[999] ;
 130:  CALL ZERO    ;
/POS
/END

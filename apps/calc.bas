
DIM ACC AS INT
DIM NUM AS INT
DIM OP AS INT
DIM KEY AS INT
DIM PASS AS INT

LET PASS = 0

CONST IRQVAL = &HFFFF
CONST IOADDR = &HFFF0

DIM IRQPTR AS INT PTR
DIM IOPTR AS INT PTR

LET IRQPTR = IRQVAL
LET IOPTR = IOADDR

WHILE 1

    WHILE NOT PEEK IRQPTR
    
    LET KEY = PEEK IOPTR
    
    REM PASS 0, READ THE ACC
    IF PASS = 0 THEN
        
        IF KEY < 10 THEN
            LET ACC = ACC * 10 + KEY
        ELSE
            LET OP = KEY
            LET PASS = 1
        FI
        
    ELSE IF PASS = 1 THEN
        
        IF KEY < 10 THEN
            
        
        
    
    
    
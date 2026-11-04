.MODEL SMALL
.STACK 100H

.DATA

MAX_USERS  EQU 10
names      DB MAX_USERS * 15 DUP(0)
passwords  DB MAX_USERS * 15 DUP(0)
userids    DW MAX_USERS DUP(0)
usercount  DB 0
nextid     DW 1001
currentuser DB 0
inputid     DW ?

maintitle DB 13,10
          DB "========================================",13,10
          DB "       DHAKA METRO SMART TICKET",13,10
          DB "========================================",13,10
          DB "$"

mainmenu DB 13,10
         DB "1. Register",13,10
         DB "2. Login",13,10
         DB "3. Exit Website",13,10
         DB "Enter choice: $"

registertitle DB 13,10
              DB "========================================",13,10
              DB "              REGISTER",13,10
              DB "========================================",13,10
              DB "$"

entername DB 13,10, "Enter name: $"

enterpassword DB 13,10, "Enter password: $"

registrationsuccess DB 13,10
                    DB "Registration successful!",13,10
                    DB "Your Metro ID is: $"


booktitle DB 13,10
          DB "========================================",13,10
          DB "      MRT LINE-6 STATION DATA",13,10
          DB "========================================",13,10
          DB "$"

bookmenu DB 13,10
         DB "List of Stations:",13,10
         DB "1.Uttara",13,10
         DB "2.Pallabi",13,10
         DB "3.Mirpur",13,10
         DB "4.Kazipara",13,10
         DB "5.Shahbag",13,10
         DB "6.Dhaka University",13,10
         DB "$"

StationCount EQU 6

stationnames DB "Uttara          $"
             DB "Pallabi         $"
             DB "Mirpur          $"
             DB "Kazipara        $"
             DB "Shahbag         $"
             DB "Dhaka University$"

stationdist DB 0,8,14,19,28,45
stationnum  DB 0,1,2,3,4,5

startstationnumber DB ?
deststationnumber  DB ?

startstationmsg DB 13,10, "Enter starting station number: $"

destinationmsg DB 13,10, "Enter destination station number: $"

invalidstationmsg DB 13,10
                  DB "Invalid station number!",13,10
                  DB "$"

routemsg DB 13,10
         DB "Route selected successfully!",13,10
         DB "$"

frommsg DB "From: $"
tomsg   DB "To: $"
distmsg DB "Distance: $"


routevalid     DB 0

basefare       DW 20
fareperkm      DW 2
peaksurcharge  DW 15

basefareonly   DW 0
calculatedfare DW 0
singlefare     DW 0
distancekm     DW 0
ispeakhour     DB 0

ticketnumber   DW 5000

cardbalance    DW 0
balanceloaded  DB 0

; Multiple ticket
ticketqty      DW 1
totalfare      DW 0


userlimitmsg DB 13,10
             DB "Maximum number of passengers reached.",13,10
             DB "$"

logintitle DB 13,10
           DB "========================================",13,10
           DB "                 LOGIN",13,10
           DB "========================================",13,10
           DB "$"

loginidmsg DB 13,10, "Enter Metro ID: $"

loginpasswordmsg DB 13,10, "Password: $"

loginsuccess DB 13,10
             DB "Login successful!",13,10
             DB "Welcome, $"

wronglogin DB 13,10
           DB "Invalid ID or password!",13,10
           DB "$"

loggedtitle DB 13,10
            DB "========================================",13,10
            DB "              LOGGED MENU",13,10
            DB "========================================",13,10
            DB "$"

loggedmenu DB 13,10
           DB "1. Book Ticket",13,10
           DB "2. Checkout",13,10
           DB "3. Past History",13,10
           DB "4. Rapid Pass Balance",13,10
           DB "5. Logout",13,10
           DB "Enter choice: $"

logoutmsg DB 13,10
          DB "Logged out successfully.",13,10
          DB "$"

exitmsg DB 13,10
        DB "Thank you for using Dhaka Metro Smart Ticket System!",13,10
        DB "$"

invalidmsg DB 13,10
           DB "Invalid choice. Please try again.",13,10
           DB "$"


MAX_HISTORY EQU 20

historycount DW 0
totaltickets DW 0
totalrevenue DW 0

historyticket DW MAX_HISTORY DUP(0)
historysource DB MAX_HISTORY DUP(0)
historydest   DB MAX_HISTORY DUP(0)
historyfare   DW MAX_HISTORY DUP(0)
historyqty    DW MAX_HISTORY DUP(0)

stationvisits DB StationCount DUP(0)

historytitle DB 13,10
             DB "========================================",13,10
             DB "             TRAVEL HISTORY",13,10
             DB "========================================",13,10
             DB "$"

nohistorymsg DB 13,10
             DB "No tickets purchased yet.",13,10
             DB "$"

frequentnone DB "None$"

historyticketmsg DB 13,10, "Ticket No : $"

qtymsg DB 13,10,"Tickets   : $"

revenuetitle DB 13,10
             DB "========================================",13,10
             DB "              REVENUE REPORT",13,10
             DB "========================================",13,10
             DB "$"

ticketssoldmsg DB 13,10, "Total Tickets Sold: $"

revenuemsg DB 13,10, "Total Revenue (Tk): $"

frequentmsg DB 13,10, "Most Visited Station: $"


ticketheader DB 13,10
             DB "========================================",13,10
             DB "              YOUR TICKET",13,10
             DB "========================================",13,10
             DB "$"

ticketnummsg DB "Ticket No : $"

frommsg2 DB 13,10, "From      : $"

tomsg2 DB 13,10, "To        : $"

faremsg2 DB 13,10, "Fare (1 ticket): $"

ticketqtymsg DB 13,10, "Number of Tickets: $"

totalfaremsg DB 13,10, "Total Payable (Tk): $"

peakfaremsg DB 13,10, "Peak Hour Surcharge: Tk $"

thankyoumsg DB 13,10
            DB "Thank you for travelling with Dhaka Metro!",13,10
            DB "$"


paymentmenumsg DB 13,10
               DB "Select Payment Method:",13,10
               DB "1. Cash",13,10
               DB "2. Rapid Pass (Balance)",13,10
               DB "Enter choice: $"

loadbalancemsg DB 13,10,"Enter amount to load into Rapid Pass card: Tk $"

balanceloadedmsg DB 13,10
                 DB "Balance loaded successfully!",13,10
                 DB "$"

insufficientmsg DB 13,10
                DB "Insufficient balance! Transaction blocked.",13,10
                DB "$"

cashpaymsg DB 13,10
           DB "Paying by Cash...",13,10
           DB "$"

cardpaysuccess DB 13,10
               DB "Payment successful via Rapid Pass!",13,10
               DB "$"

remainingbalmsg DB 13,10, "Remaining Balance: Tk $"

invalidpaymsg DB 13,10
              DB "Invalid choice!",13,10
              DB "$"

rapidpasstitle DB 13,10
               DB "========================================",13,10
               DB "            RAPID PASS BALANCE",13,10
               DB "========================================",13,10
               DB "$"

currentbalancemsg DB 13,10, "Current Balance: Tk $"


.CODE


; ============================================================
; MAIN
; ============================================================

MAIN PROC

    MOV AX,@DATA
    MOV DS,AX


MAIN_MENU:

    LEA DX,maintitle
    MOV AH,09H
    INT 21H

    LEA DX,mainmenu
    MOV AH,09H
    INT 21H

    CALL READ_CHOICE

    CMP AL,'1'
    JE REGISTER

    CMP AL,'2'
    JE LOGIN

    CMP AL,'3'
    JE EXIT_PROGRAM

    LEA DX,invalidmsg
    MOV AH,09H
    INT 21H

    JMP MAIN_MENU 
    

; ============================================================
; REGISTER
; ============================================================


REGISTER:

    MOV AL,usercount ;user limit check
    CMP AL,MAX_USERS
    JGE USER_LIMIT

    LEA DX,registertitle
    MOV AH,09H
    INT 21H

    MOV AX,0
    MOV AL,usercount

    MOV CX,2
    MUL CX

    MOV SI,AX        ;id pos

    MOV AX,nextid
    MOV userids[SI],AX

    INC nextid

    LEA DX,entername  ;name saving
    MOV AH,09H
    INT 21H

    MOV AX,0
    MOV AL,usercount

    MOV CX,15
    MUL CX

    MOV DI,AX
    MOV SI,0000H


READ_NAME:

    MOV AH,01H
    INT 21H

    CMP AL,13
    JE NAME_DONE

    CMP SI,14
    JGE READ_NAME_LIMIT
    MOV names[DI],AL
    INC DI
    INC SI
    JMP READ_NAME

READ_NAME_LIMIT:
    JMP READ_NAME


NAME_DONE:

    MOV AL,0
    MOV names[DI],AL

    LEA DX,enterpassword  ;work on password
    MOV AH,09H
    INT 21H

    MOV AX,0
    MOV AL,usercount

    MOV CX,15
    MUL CX

    MOV DI,AX
    MOV SI,0000H


READ_PASSWORD:

    MOV AH,01H
    INT 21H

    CMP AL,13
    JE PASSWORD_DONE

    CMP SI,14
    JGE READ_PASSWORD_LIMIT
    MOV passwords[DI],AL
    INC DI
    INC SI
    JMP READ_PASSWORD

READ_PASSWORD_LIMIT:
    JMP READ_PASSWORD


PASSWORD_DONE:

    MOV AL,0
    MOV passwords[DI],AL

    INC usercount

    LEA DX,registrationsuccess
    MOV AH,09H
    INT 21H

    MOV AX,nextid
    SUB AX,1

    CALL PRINT_NUMBER

    JMP MAIN_MENU


USER_LIMIT:

    LEA DX,userlimitmsg
    MOV AH,09H
    INT 21H

    JMP MAIN_MENU


; ============================================================
; LOGIN
; ============================================================

LOGIN:

    LEA DX,logintitle
    MOV AH,09H
    INT 21H

    LEA DX,loginidmsg
    MOV AH,09H
    INT 21H

    CALL READ_NUMBER
    MOV inputid,AX

    MOV SI,0
    MOV BX,0


FIND_ID:

    MOV AX,0
    MOV AL,usercount

    CMP BX,AX
    JGE LOGIN_FAILED

    MOV AX,userids[SI]

    CMP AX,inputid
    JE ID_FOUND

    ADD SI,2
    ADD BX,1

    JMP FIND_ID


ID_FOUND:

    MOV currentuser,BL

    LEA DX,loginpasswordmsg
    MOV AH,09H
    INT 21H

    MOV AX,0
    MOV AL,currentuser

    MOV CX,15
    MUL CX

    MOV SI,AX

    MOV DI,SI
    MOV CX,0


CHECK_PASSWORD:

    MOV AH,01H
    INT 21H

    CMP AL,13
    JE PASSWORD_OK

    CMP CX,14
    JGE PASSWORD_TOO_LONG

    CMP AL,passwords[DI]
    JNE PASSWORD_WRONG

    INC DI
    INC CX

    JMP CHECK_PASSWORD


PASSWORD_OK:

    MOV AL,passwords[DI]

    CMP AL,0
    JE LOGIN_SUCCESS

    JMP LOGIN_FAILED


PASSWORD_TOO_LONG:

TOO_LONG_LOOP:

    MOV AH,01H
    INT 21H

    CMP AL,13
    JE LOGIN_FAILED

    JMP TOO_LONG_LOOP


PASSWORD_WRONG:

WRONG_PASSWORD_LOOP:

    MOV AH,01H
    INT 21H

    CMP AL,13
    JE LOGIN_FAILED

    JMP WRONG_PASSWORD_LOOP


LOGIN_SUCCESS:

    LEA DX,loginsuccess
    MOV AH,09H
    INT 21H

    MOV AX,0
    MOV AL,currentuser

    MOV CX,15
    MUL CX

    MOV SI,AX


PRINT_LOGIN_NAME:

    MOV DL,names[SI]

    CMP DL,0
    JE LOGIN_NAME_DONE

    MOV AH,02H
    INT 21H

    INC SI

    JMP PRINT_LOGIN_NAME


LOGIN_NAME_DONE:

    MOV DL,13
    MOV AH,02H
    INT 21H

    MOV DL,10
    MOV AH,02H
    INT 21H

    JMP LOGGED_MENU


LOGIN_FAILED:

    LEA DX,wronglogin
    MOV AH,09H
    INT 21H

    JMP MAIN_MENU


; ============================================================
; LOGGED MENU
; ============================================================

LOGGED_MENU:

    LEA DX,loggedtitle
    MOV AH,09H
    INT 21H

    LEA DX,loggedmenu
    MOV AH,09H
    INT 21H

    CALL READ_CHOICE

    CMP AL,'1'
    JE BOOK_TICKET

    CMP AL,'2'
    JE CHECKOUT

    CMP AL,'3'
    JE PAST_HISTORY

    CMP AL,'4'
    JE RAPID_PASS_SCREEN

    CMP AL,'5'
    JE LOGOUT

    LEA DX,invalidmsg
    MOV AH,09H
    INT 21H

    JMP LOGGED_MENU


; ============================================================
; BOOK TICKET
; ============================================================

BOOK_TICKET:

    CALL DISPLAY_STATIONS
    CALL SELECT_ROUTE

    CMP routevalid,1
    JNE BOOK_END

    CALL CALCULATE_FARE
    CALL GET_QUANTITY
    CALL PAYMENT_METHOD


BOOK_END:

    JMP LOGGED_MENU


; ============================================================
; SHOW REVENUE
; ============================================================

CHECKOUT:

    CALL SHOW_REVENUE
    JMP LOGGED_MENU


; ============================================================
; PAST HISTORY
; ============================================================

PAST_HISTORY:

    CALL SHOW_HISTORY
    JMP LOGGED_MENU


; ============================================================
; RAPID PASS BALANCE
; ============================================================

RAPID_PASS_SCREEN:

    LEA DX,rapidpasstitle
    MOV AH,09H
    INT 21H

    LEA DX,currentbalancemsg
    MOV AH,09H
    INT 21H

    MOV AX,cardbalance
    CALL PRINT_NUMBER

    CALL LOAD_BALANCE

    JMP LOGGED_MENU


; ============================================================
; LOGOUT
; ============================================================

LOGOUT:

    MOV currentuser,0

    LEA DX,logoutmsg
    MOV AH,09H
    INT 21H

    JMP MAIN_MENU


EXIT_PROGRAM:

    LEA DX,exitmsg
    MOV AH,09H
    INT 21H

    MOV AH,4CH
    INT 21H


; ============================================================
; INPUT
; ============================================================

READ_CHOICE PROC

    MOV AH,01H
    INT 21H

    MOV BL,AL


WAIT_ENTER:

    MOV AH,01H
    INT 21H

    CMP AL,13
    JNE WAIT_ENTER

    MOV AL,BL

    RET

READ_CHOICE ENDP


READ_NUMBER PROC

    MOV BX,0000H


READ_DIGIT:

    MOV AH,01H
    INT 21H

    CMP AL,13
    JE NUMBER_DONE

    CMP AL,'0'
    JL READ_DIGIT

    CMP AL,'9'
    JG READ_DIGIT

    SUB AL,'0'
    MOV AH,00H

    MOV SI,AX

    MOV AX,BX
    MOV CX,10
    MUL CX

    ADD AX,SI
    MOV BX,AX

    JMP READ_DIGIT


NUMBER_DONE:

    MOV AX,BX
    RET

READ_NUMBER ENDP


PRINT_NUMBER PROC

    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    MOV CX,0000H
    MOV BX,10

    CMP AX,0
    JNE CONVERT_NUMBER

    MOV DL,'0'
    MOV AH,02H
    INT 21H

    JMP PRINT_DONE


CONVERT_NUMBER:

    MOV DX,0000H
    DIV BX

    PUSH DX
    INC CX

    CMP AX,0
    JNE CONVERT_NUMBER


PRINT_DIGITS:

    POP DX
    ADD DL,'0'

    MOV AH,02H
    INT 21H

    DEC CX
    CMP CX,0
    JNE PRINT_DIGITS


PRINT_DONE:

    POP DX
    POP CX
    POP BX
    POP AX        

    RET

PRINT_NUMBER ENDP


; ============================================================
;  Station List + Route Selection
; ============================================================

DISPLAY_STATIONS PROC

    LEA DX,booktitle
    MOV AH,09H
    INT 21H

    LEA DX,bookmenu
    MOV AH,09H
    INT 21H

    RET

DISPLAY_STATIONS ENDP


READ_STATION PROC

    CALL READ_CHOICE

    SUB AL,030H

    CMP AL,1
    JL INVALID_STATION

    CMP AL,6
    JG INVALID_STATION

    DEC AL

    RET


INVALID_STATION:

    MOV AL,0FEH
    RET

READ_STATION ENDP


SELECT_ROUTE PROC

    LEA DX,startstationmsg
    MOV AH,09H
    INT 21H

    CALL READ_STATION

    CMP AL,0FEH
    JE INVALID_START

    MOV startstationnumber,AL


    LEA DX,destinationmsg
    MOV AH,09H
    INT 21H

    CALL READ_STATION

    CMP AL,0FEH
    JE INVALID_DESTINATION

    MOV deststationnumber,AL


    LEA DX,routemsg
    MOV AH,09H
    INT 21H

    CALL SHOW_TO_FROM

    MOV routevalid,1

    RET


INVALID_START:

    LEA DX,invalidstationmsg
    MOV AH,09H
    INT 21H

    MOV routevalid,0

    RET


INVALID_DESTINATION:

    LEA DX,invalidstationmsg
    MOV AH,09H
    INT 21H

    MOV routevalid,0

    RET

SELECT_ROUTE ENDP


DISPLAY_STATION_NAME PROC

    MOV AH,00H

    MOV SI,AX

    MOV AX,17
    MUL SI

    MOV SI,AX

    LEA DX,stationnames[SI]

    MOV AH,09H
    INT 21H

    RET

DISPLAY_STATION_NAME ENDP


SHOW_TO_FROM PROC

    LEA DX,frommsg
    MOV AH,09H
    INT 21H

    MOV AL,startstationnumber
    CALL DISPLAY_STATION_NAME

    LEA DX,tomsg
    MOV AH,09H
    INT 21H

    MOV AL,deststationnumber
    CALL DISPLAY_STATION_NAME

    RET

SHOW_TO_FROM ENDP


; ============================================================
; Peak Hour Calculation
; ============================================================

CHECK_PEAK_HOUR PROC

    MOV AH,2CH
    INT 21H

    CMP CH,8
    JL CHECK_EVENING

    CMP CH,10
    JGE CHECK_EVENING

    MOV AL,1
    RET


CHECK_EVENING:

    CMP CH,17
    JL NOT_PEAK

    CMP CH,20
    JGE NOT_PEAK

    MOV AL,1
    RET


NOT_PEAK:

    MOV AL,0
    RET

CHECK_PEAK_HOUR ENDP


; ============================================================
; Fare Calculation + Ticket Generation
; ============================================================

CALCULATE_FARE PROC

    MOV BX,0000H
    MOV BL,startstationnumber

    MOV AL,stationdist[BX]
    MOV AH,00H

    MOV distancekm,AX


    MOV BX,0000H
    MOV BL,deststationnumber

    MOV AL,stationdist[BX]
    MOV AH,00H

    SUB AX,distancekm

    JGE POSITIVE_DISTANCE

    NEG AX


POSITIVE_DISTANCE:

    MOV distancekm,AX

    MOV AX,distancekm
    MOV BX,fareperkm
    MUL BX

    ADD AX,basefare

    MOV basefareonly,AX
    MOV singlefare,AX
    MOV calculatedfare,AX


    CALL CHECK_PEAK_HOUR

    CMP AL,1
    JNE NORMAL_FARE

    MOV ispeakhour,1

    MOV AX,calculatedfare
    ADD AX,peaksurcharge

    MOV calculatedfare,AX

    JMP FARE_DONE


NORMAL_FARE:

    MOV ispeakhour,0


FARE_DONE:

    RET

CALCULATE_FARE ENDP


; ============================================================
; MULTIPLE TICKETS
; ============================================================

GET_QUANTITY PROC

    LEA DX,ticketqtymsg
    MOV AH,09H
    INT 21H

    CALL READ_NUMBER

    CMP AX,0
    JNE VALID_QTY

    MOV AX,1


VALID_QTY:

    MOV ticketqty,AX

    MOV BX,AX

    MOV AX,calculatedfare
    MUL BX

    MOV totalfare,AX
    MOV calculatedfare,AX

    RET

GET_QUANTITY ENDP


; ============================================================
; TICKET GENERATION
; ============================================================

GENERATE_TICKET PROC

    LEA DX,ticketheader
    MOV AH,09H
    INT 21H


    LEA DX,ticketnummsg
    MOV AH,09H
    INT 21H

    MOV AX,ticketnumber
    CALL PRINT_NUMBER


    LEA DX,frommsg2
    MOV AH,09H
    INT 21H

    MOV AL,startstationnumber
    CALL DISPLAY_STATION_NAME


    LEA DX,tomsg2
    MOV AH,09H
    INT 21H

    MOV AL,deststationnumber
    CALL DISPLAY_STATION_NAME


    LEA DX,faremsg2
    MOV AH,09H
    INT 21H

    MOV AX,singlefare
    CALL PRINT_NUMBER


    LEA DX,ticketqtymsg
    MOV AH,09H
    INT 21H

    MOV AX,ticketqty
    CALL PRINT_NUMBER


    CMP ispeakhour,1
    JNE SHOW_TOTAL

    LEA DX,peakfaremsg
    MOV AH,09H
    INT 21H

    MOV AX,peaksurcharge
    CALL PRINT_NUMBER


SHOW_TOTAL:

    LEA DX,totalfaremsg
    MOV AH,09H
    INT 21H

    MOV AX,totalfare
    CALL PRINT_NUMBER


    LEA DX,thankyoumsg
    MOV AH,09H
    INT 21H

    MOV AX,ticketqty
    ADD ticketnumber,AX

    RET

GENERATE_TICKET ENDP


; ============================================================
; PAYMENT
; ============================================================

LOAD_BALANCE PROC

    LEA DX,loadbalancemsg
    MOV AH,09H
    INT 21H

    CALL READ_NUMBER

    ADD cardbalance,AX

    MOV balanceloaded,1

    LEA DX,balanceloadedmsg
    MOV AH,09H
    INT 21H

    RET

LOAD_BALANCE ENDP


PAYMENT_METHOD PROC

    LEA DX,paymentmenumsg
    MOV AH,09H
    INT 21H

    CALL READ_CHOICE

    CMP AL,'1'
    JE PAY_CASH

    CMP AL,'2'
    JE PAY_CARD

    LEA DX,invalidpaymsg
    MOV AH,09H
    INT 21H

    RET


PAY_CASH:

    LEA DX,cashpaymsg
    MOV AH,09H
    INT 21H

    CALL RECORD_TICKET  ;for history
    CALL GENERATE_TICKET

    RET


PAY_CARD:

    CMP balanceloaded,0
    JNE CHECK_BALANCE

    CALL LOAD_BALANCE


CHECK_BALANCE:

    MOV AX,cardbalance

    CMP AX,totalfare
    JGE SUFFICIENT_BALANCE

    LEA DX,insufficientmsg
    MOV AH,09H
    INT 21H

    RET


SUFFICIENT_BALANCE:

    MOV AX,cardbalance
    SUB AX,totalfare
    MOV cardbalance,AX


    LEA DX,cardpaysuccess
    MOV AH,09H
    INT 21H

    LEA DX,remainingbalmsg
    MOV AH,09H
    INT 21H

    MOV AX,cardbalance
    CALL PRINT_NUMBER


    CALL RECORD_TICKET  ;for history
    CALL GENERATE_TICKET

    RET

PAYMENT_METHOD ENDP


; ============================================================
; Travel History
; ============================================================

RECORD_TICKET PROC

    MOV AX,totaltickets;prev total
    ADD AX,ticketqty ;purchased now
    MOV totaltickets,AX

    MOV AX,totalrevenue
    ADD AX,totalfare
    MOV totalrevenue,AX


    MOV AX,historycount

    CMP AX,MAX_HISTORY
    JGE UPDATE_VISITS


    MOV BX,AX
    ADD BX,BX

    MOV AX,ticketnumber
    MOV historyticket[BX],AX ;save ticketno

    MOV AX,ticketqty
    MOV historyqty[BX],AX

    MOV BX,historycount

    MOV AL,startstationnumber
    MOV historysource[BX],AL

    MOV AL,deststationnumber
    MOV historydest[BX],AL

    MOV BX,historycount
    ADD BX,BX

    MOV AX,totalfare
    MOV historyfare[BX],AX

    INC historycount


UPDATE_VISITS:

    MOV BX,0000H
    MOV BL,startstationnumber
    INC stationvisits[BX]

    MOV BX,0000H
    MOV BL,deststationnumber
    INC stationvisits[BX]

    RET

RECORD_TICKET ENDP


SHOW_HISTORY PROC

    LEA DX,historytitle
    MOV AH,09H
    INT 21H

    CMP historycount,0
    JE NO_HISTORY

    MOV BX,0000H


HISTORY_LOOP:

    CMP BX,historycount
    JGE SHOW_FREQUENT


    LEA DX,historyticketmsg
    MOV AH,09H
    INT 21H

    MOV SI,BX
    ADD SI,SI

    MOV AX,historyticket[SI]  ;ticket number show
    CALL PRINT_NUMBER


    LEA DX,frommsg2
    MOV AH,09H
    INT 21H

    MOV AL,historysource[BX]
    CALL DISPLAY_STATION_NAME


    LEA DX,tomsg2
    MOV AH,09H
    INT 21H

    MOV AL,historydest[BX]
    CALL DISPLAY_STATION_NAME


    LEA DX,qtymsg
    MOV AH,09H
    INT 21H

    MOV SI,BX
    ADD SI,SI

    MOV AX,historyqty[SI]
    CALL PRINT_NUMBER


    LEA DX,totalfaremsg
    MOV AH,09H
    INT 21H

    MOV SI,BX
    ADD SI,SI

    MOV AX,historyfare[SI]
    CALL PRINT_NUMBER


    INC BX

    JMP HISTORY_LOOP


NO_HISTORY:

    LEA DX,nohistorymsg
    MOV AH,09H
    INT 21H

    RET


SHOW_FREQUENT:

    CALL SHOW_FREQUENT_STATION

    RET

SHOW_HISTORY ENDP


SHOW_FREQUENT_STATION PROC

    LEA DX,frequentmsg
    MOV AH,09H
    INT 21H

    MOV BX,0000H
    MOV CX,0000H


; First pass:
; Find the highest visit count.

FREQ_LOOP:

    CMP BX,StationCount
    JGE FREQ_DONE

    MOV AL,stationvisits[BX]
    MOV AH,00H

    CMP AX,CX
    JLE NEXT_FREQ

    MOV CX,AX


NEXT_FREQ:

    INC BX

    JMP FREQ_LOOP


FREQ_DONE:


    CMP CX,1
    JLE NO_FREQUENT_STATION

    MOV BX,0000H
    MOV DI,0000H


FREQ_SHOW_LOOP:

    CMP BX,StationCount
    JGE FREQ_SHOW_DONE

    MOV AL,stationvisits[BX]
    MOV AH,00H

    CMP AX,CX
    JNE NEXT_SHOW_FREQ


    ; If this is not the first station,print comma and space.

    CMP DI,0
    JE SHOW_FIRST_FREQ

    MOV DL,','
    MOV AH,02H
    INT 21H

    MOV DL,' '
    MOV AH,02H
    INT 21H


SHOW_FIRST_FREQ:

    MOV AX,BX
    CALL DISPLAY_STATION_NAME

    MOV DI,1


NEXT_SHOW_FREQ:

    INC BX

    JMP FREQ_SHOW_LOOP


FREQ_SHOW_DONE:

    RET


NO_FREQUENT_STATION:

    LEA DX,frequentnone
    MOV AH,09H
    INT 21H

    RET

SHOW_FREQUENT_STATION ENDP


; ============================================================
; Revenue Report
; ============================================================

SHOW_REVENUE PROC

    LEA DX,revenuetitle
    MOV AH,09H
    INT 21H

    LEA DX,ticketssoldmsg
    MOV AH,09H
    INT 21H

    MOV AX,totaltickets
    CALL PRINT_NUMBER


    LEA DX,revenuemsg
    MOV AH,09H
    INT 21H

    MOV AX,totalrevenue
    CALL PRINT_NUMBER

    RET

SHOW_REVENUE ENDP


END MAIN

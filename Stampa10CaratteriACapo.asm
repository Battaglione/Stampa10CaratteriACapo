;Rossetti Jacopo
;3INA
;15/12/2020

TITLE ciclo while do 
.MODEL SMALL    
    
.DATA 
   CR DB 013
   LF DB 010
   LETTERA DB ?

.CODE                                                                                                

.STARTUP 
    MOV CX,10   
; legge un carattere      
    MOV AH,01h      ; numero del servizio  
    INT 21h         ; interruzione SW di MSDOS
                    ; in AL il codice Ascii del carattere premuto,
                    ; in AH il codice di scansione.
    MOV LETTERA,AL 
stampa:         
    
    
    MOV DL,LF
    MOV AH,02h
    INT 21h
    
    MOV DL,CR
    MOV AH,02h
    INT 21h
    
    MOV DL,LETTERA       ; codice Ascii del carattere da stampare
    MOV AH,02h      ; numero del servizio  
    INT 21h         ; interruzione SW di MSDOS
    
    loop stampa

; exit to operating system. 
    mov AH, 4ch     ; numero del servizio  
    INT 21h         ; interruzione SW di MSDOS
END


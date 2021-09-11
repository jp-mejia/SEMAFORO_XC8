#include "p16F628a.inc" ;incluir librerias relacionadas con el dispositivo
__CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF
;configuración del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)
RES_VECT CODE 0x0000 ; processor reset vector
GOTO START ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE ; let linker place main program
;variables para el contador:
i equ 0x30
j equ 0x31
k equ 0x32
m equ 0x33
x equ 0x34
y equ 0x35
z equ 0x36
a equ 0x37

;inicio del programa:
START
MOVLW 0x07 ;Apagar comparadores
MOVWF CMCON
BCF STATUS, RP1 ;Cambiar al banco 1
BSF STATUS, RP0
MOVLW b'00000000' ;Establecer puerto B como salida (los 8 bits del puerto)
MOVWF TRISB
BCF STATUS, RP0 ;Regresar al banco 0
NOP
CLRW PORTB
INICIO 
inicio:

CLRW PORTB
bcf PORTB,0 ;poner el puerto B0 (bit 0 del puerto B) en 0
;nop ;NOPs de relleno (ajuste de tiempo)
MOVLW b'01000010'
MOVWF m
MOVFW m
MOVWF PORTB    
bsf PORTB,0 ;poner el puerto B0 (bit 0 del puerto B) en 1
call tiempo5 ;llamar a la rutina de tiempo   


CLRW PORTB
;nop ;NOPs de relleno (ajuste de tiempo)    
MOVLW b'01000100'
MOVWF x
MOVFW x
MOVWF PORTB
bsf PORTB,0 ;poner el puerto B0 (bit 0 del puerto B) en 1
call tiempo1 ;llamar a la rutina de tiempo
nop
nop
nop
nop
 
CLRW PORTB
MOVLW b'00011000'
MOVWF m
MOVFW m
MOVWF PORTB 
bsf PORTB,0 ;poner el puerto B0 (bit 0 del puerto B) en 1
call tiempo5 ;llamar a la rutina de tiempo
  
CLRW PORTB
MOVLW b'00101000'
MOVWF x
MOVFW x
MOVWF PORTB     
bsf PORTB,0 ;poner el puerto B0 (bit 0 del puerto B) en 1
call tiempo1 ;llamar a la rutina de tiempo
nop
goto inicio ;regresar y repetir
;rutina de tiempo
tiempo5:


movlw d'236' ;establecer valor de la variable k
movwf m
mloop:
decfsz m,f
goto mloop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movlw d'253' ;establecer valor de la variable i
movwf i
iloop:
nop ;NOPs de relleno (ajuste de tiempo)
nop

 movlw d'238' ;establecer valor de la variable j
movwf j
jloop:
nop ;NOPs de relleno (ajuste de tiempo)
movlw d'26' ;establecer valor de la variable k
movwf k
kloop:
decfsz k,f
goto kloop
decfsz j,f
goto jloop
decfsz i,f
goto iloop
return ;salir de la rutina de tiempo y regresar al
;valor de contador de programa

tiempo1:
movlw d'201' ;establecer valor de la variable k
movwf x
xloop:
nop
decfsz x,f
goto xloop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movlw d'252' ;establecer valor de la variable i
movwf y
yloop:
nop ;NOPs de relleno (ajuste de tiempo)
nop
nop
nop
nop
nop 
movlw d'113' ;establecer valor de la variable j
movwf z
zloop:
nop ;NOPs de relleno (ajuste de tiempo)
movlw d'10' ;establecer valor de la variable k
movwf a
aloop:
decfsz a,f
goto aloop
decfsz z,f
goto zloop
decfsz y,f
goto yloop
return ;salir de la rutina de tiempo y regresar al
;valor de contador de programa
END
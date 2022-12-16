## CS 254 Program 9 
##
## Celsius to Fahrenheit
##
## Jonathan Gargano
## May 8, 2021
##
## Register use table:
##
## $f2 celsius input/result
## $f4 conversion factors

          .globl main
          .text
       
main:

li $v0, 4           #load syscall code print string
la $a0, askfloat    #load askfloat string
syscall             #print askfloat

li $v0, 6           #load syscall code read float
syscall             #read float

l.s $f4, convmult   #$f4 = 9.0
mul.s $f2, $f0, $f4 #$f2 = (celsius input) * (9.0)

l.s $f4, convdiv    #$f4 = 5.0
div.s $f2, $f2, $f4 #$f2 = (result) / (5.0)

l.s $f4, convadd    #$f4 = 32.0
add.s $f2, $f2, $f4 #$f2 = (result) + (32.0)

mov.s $f12, $f2     #move result into $f12

li $v0, 4           #load syscall code print string
la $a0, result      #load result string
syscall             #print result

li $v0, 2           #load syscall code print float
syscall             #print float

li $v0, 10          #load syscall to end program
syscall             #end program

          .data

askfloat:     .asciiz "Enter Celsius: "
result:       .asciiz "\nFahrenheit: "
convmult:     .float 9.0
convdiv:      .float 5.0
convadd:      .float 32.0
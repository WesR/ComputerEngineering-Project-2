# ComputerEngineering-Project-2
ECGR 2181 – Fall 2018 – Project 2 (Final project)
By: Dylan, Ron, and Wes

Done using VHDL and Vivado

## part 1
Takes an input via switches and converts it to hex, which is then displayed to the four 7 segment displays.


## part 2
The goal of this Task is to connect the lower 8 switches
to form an 8-bit two’s complement signed number and display it as a decimal result on the FOUR 7-
segment displays. For the seven segment displays, you need to display a negative sign (if the number is
negative, nothing/all segments off otherwise) and the absolute value on the binary number. For
example if you have FE 16 as the converted binary value from the 8 switches, then on the display it needs
to show “-002”. If the input was positive, such as 7E 16 , then the display would show as “ 126” (notice the
“space” in the leftmost 7-segment display to show a positive number).

## part 3
In this lab, you will be creating a guessing game. One lab partner will input a number
using eight of the switches, store it with btnR, then the other lab partner will guess the number and test
to see if it’s true with btnL. When btnL is pressed and the values match, only LED15 lights up and if the
values don’t match, all LEDs are turned off. The LED stays high/low until you test it again. You’ll need use
the provided debounce.vhd for the buttons

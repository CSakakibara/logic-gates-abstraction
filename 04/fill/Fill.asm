// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP) 
	@SCREEN
	D=A
	@act 	
	M=D  // store the position of screen map

(SWITCH)	
	@KBD
	D=M  
	
	@FILL   
	D; JNE  // if keyboard not equals to 0, go to fill
	
	@BLANK  //else go to blank
	0; JMP
	
(FILL)
	@act
	A=M  //go to position stored
	M=-1 // fill all bits 
	
	@VERIF
	0; JMP
	
(BLANK)
	@act
	A=M // go to position stored
	M=0 // erase all
	
	@VERIF
	0; JMP
	
(VERIF) 
	@act
	M=M+1
	D=M+1
	@KBD
	D=D-A  // to verify if the screenmap is over
	
	@LOOP
	D; JEQ 
	
	@SWITCH 
	0; JMP
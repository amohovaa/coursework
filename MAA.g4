grammar MAA;

program
   : block '.'
   ;

block
   : consts? vars? procedure* statement
   ;

consts
   : CONST ident '=' (INTEGER | FLOAT) (',' ident '=' (INTEGER | FLOAT))* ';'
   ;

vars
   : VAR ident ('=' (INTEGER | FLOAT))? (',' ident ('=' (INTEGER | FLOAT))?)* ';'
   ;

procedure
   : PROCEDURE ident ';' block ';'
   ;

statement
   : (assignstmt | callstmt | writestmt | breakstmt | continuestmt | bangstmt | beginstmt | ifstmt | whilestmt)?
   ;

assignstmt
   : ident ':=' expression
   ;

callstmt
   : CALL ident
   ;

writestmt
   : WRITE ident
   ;

bangstmt
   : '!' expression
   ;

beginstmt
   : BEGIN statement (';' statement)* END
   ;

ifstmt
   : IF condition THEN statement
   ;

whilestmt
   : WHILE condition DO statement
   ;

breakstmt     
	: BREAK
	;
	
continuestmt   
	: CONTINUE
	;

condition
   : ODD expression
   | expression ('=' | '!=' | '<' | '<=' | '>' | '>=') expression
   ;

expression
   : ('+' | '-')? term (('+' | '-') term)*
   ;

term
   : factor (('*' | '/') factor)*
   ;

factor
   : ident
   | number
   | INTEGER 
   | FLOAT 
   | '(' expression ')'
   ;

ident
   : STRING
   ;

number
   : NUMBER
   ;

BREAK     
	: 'BREAK'
	;
	
CONTINUE  
	: 'CONTINUE'
	;


WRITE
   : 'WRITE'
   ;


WHILE
   : 'WHILE'
   ;


DO
   : 'DO'
   ;


IF
   : 'IF'
   ;


THEN
   : 'THEN'
   ;


ODD
   : 'ODD'
   ;


BEGIN
   : 'BEGIN'
   ;


END
   : 'END'
   ;


CALL
   : 'CALL'
   ;


CONST
   : 'CONST'
   ;


VAR
   : 'VAR'
   ;


PROCEDURE
   : 'PROCEDURE'
   ;


FLOAT       
	: '-'? NUMBER'.'NUMBER
	;
	
	
INTEGER     
	: '-'? NUMBER
	;
	

STRING
   : [a-zA-Z] [a-zA-Z]*
   ;


NUMBER
   : [0-9] +
   ;


BlockComment
: '/*' .*? '*/'
-> skip
;


LineComment
: '//' ~[\r\n]*
-> skip
;


WS
   : [ \t\r\n] -> skip
   ;
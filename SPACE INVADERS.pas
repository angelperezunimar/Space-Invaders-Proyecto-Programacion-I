//||==========================||//
//|| SPACE INVADERS EN PASCAL ||//
//||==========================||//

// Realizado por: Angel Pérez, Abdl Taktak y Samuel Marcano //



program untitled;
{Empieza la declaracion de variables, cada una tiene una funcion especifica para el juego y seran explicadas en un archivo de texto}
uses CRT, DOS;
var
	scr: integer;
	fnp: integer;
//funcion para la validacion del nombre y apellido
procedure validacion;
var
p1,p2,nickname:string;
c1,c2,codigo1,codigo2,auxiliar1,auxiliar2:integer;
begin
c1:=0;
c2:=0;
repeat
	writeln ('introduzca su nombre:');
	readln(p1);
	val (p1,c1,codigo1);
until codigo1>0;
repeat
	writeln('introduzca su apellido');
	readln (p2);
	val(p2,c2,codigo2);
until codigo2 > 0;

writeln ('Ingrese su nombre de usuario, puede usar caracteres y numeres:');
readln (nickname);
writeln;

readln();
end;
	

		
	
BEGIN
 writeln ('Bienvenido a SPACE INVADERS A.A.S');
 validacion;
 
 
 
	
	
END.


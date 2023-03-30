//||==========================||//
//|| SPACE INVADERS EN PASCAL ||//
//||==========================||//

// Realizado por: Angel Pérez, Abdl Taktak y Samuel Marcano //

program SpaceInvaders;

uses CRT;

const
APantalla = 24;
LPantalla = 77;

var {Empieza la declaracion de variables, cada una tiene una funcion especifica para el juego y seran explicadas en un archivo de texto}
scr,fnp,opciones,dificultades,bx,by,ppx,ppy,dir,l,aliensb:integer;
nickname:string;
aliens: array[1..6] of boolean;
BActivo: boolean;
apy: array[1..6] of integer;
apx: array[1..6] of integer;
rdm: array[1..6] of integer;

//Procedimiento para mostrar al jugador en pantalla
procedure DPlayer;
begin
gotoxy(ppx,ppy);
textcolor(15);
write('<|A|>');
end; //end final del procedimiento

//Procedimiento para el movimiento del jugador en pantalla 
procedure MPlayer;
begin
if keypressed then
    begin
      case readkey of
		#75:
			begin
				gotoxy(ppx,ppy);
				writeln('      ');
				ppx := ppx - 1;
				if ppx < 1 then
				  ppx := 1;
				  DPlayer;
			end;//end del case #75
			
		#77:
			begin
			gotoxy(ppx,ppy);
				writeln('       ');
				ppx := ppx + 1;
				if ppx > (LPantalla - 6) then
				  ppx := 71;		
				  DPlayer;	
			end;//end del case #77
		end;//end del case
	end; //end del if
end; //end final del procedimiento

//Procedimiento para mover aliens
procedure DAliens;
var i: integer;
Begin

	for i:= 1 to 6 do
	begin
		
		gotoxy(apx[i], apy[i]);
		
		if (aliens[i] = true) and (i = 1) then
		begin textcolor(4);
			writeln('    |<>/´|´\<>| ');
			gotoxy(apx[i], apy[i] + 1);
			writeln('--|=(+)|\|/|(+)=|--');
			gotoxy(apx[i], apy[i] + 2);
			writeln('  /\  ;\,|,/;  /\');
			gotoxy(apx[i], apy[i] + 3);
			write(' /  \         /  \');
			gotoxy(apx[i], apy[i] + 4);
		end;
		
		if (aliens[i] = true) and (i >= 2) and (i < 4) then
		begin
		textcolor(3);
			write('[=I.<>.I=]');
		end;
		
		if (aliens[i] = true) and (i >= 4) then
		begin
		textcolor(2);
			write('I-/.-.\-I');
		end;


	end;

end;

//Procedimiento para mover aliens
procedure MAliens;
var i:integer;
begin

	for i:= 1 to 6 do
	
	if dir = 1 then
	begin
	gotoxy(apx[i],apy[i]);
	writeln('                     ');
	writeln('                      ');
	writeln('                     ');
	writeln('                     ');
	write('                     ');
	apx[i] := apx[i] + 1;
	end;
	
	if dir = -1 then
	begin
	gotoxy(apx[i],apy[i]);
	writeln('                     ');
	writeln('                      ');
	writeln('                     ');
	writeln('                     ');
	write('                     ');
	apx[i]:= apx[i] - 1;
	end;
	
	
	
	if keypressed then
    begin
      case readkey of
		#75:
			begin
				gotoxy(ppx,ppy);
				writeln('      ');
				ppx := ppx - 1;
				if ppx < 1 then
				  ppx := 1;
				  DPlayer;
			end;//end del case #75
			
		#77:
			begin
			gotoxy(ppx,ppy);
				writeln('       ');
				ppx := ppx + 1;
				if ppx > (LPantalla - 6) then
				  ppx := 71;		
				  DPlayer;	
			end;//end del case #77
		end;//end del case
	end; //end del if
//end; //end final del procedimiento
 
end; //end del procedimiento

//Procedimiento para el movimiento del jugador en pantalla 
procedure MBullet;
begin
while (BActivo and (by > 1))  do
        begin
        textcolor(8);
		  delay(50);
          gotoxy(bx, by);
          writeln('   ');
          by := by - 1;
          gotoxy(bx, by);
          writeln('  |');
          MPlayer;
        end; //end del while
        BActivo := False;
        gotoxy(bx, by);
		writeln('    ');
end; //end final del procedimiento

//Procedimiento para el movimiento del jugador en pantalla 
procedure BPlayer;
begin
BActivo := False;
	if readkey = #32 then // barra espaciadora
	begin
		bx := ppx;
        by := ppy - 1;
        BActivo := True;
        writeln('|');
        MBullet;
        
	end;//end del if
	
end;//end final del procedimiento

//Procedimiento para la validacion del nombre y apellido
procedure validacion;
var
p1,p2:string;
c1,c2,codigo1,codigo2:integer;
const 
selfiri = 13; //{profe me gusta usar constantes ;D} <== Ese fue Samuel profe 
begin
c1:=0;
c2:=0;
repeat
	repeat
	write ('///introduzca su nombre:');
	readln(p1);
	until p1 <> '';
	val (p1,c1,codigo1);
until codigo1>0;
repeat
	repeat
	write('////introduzca su apellido:');
	readln (p2);
	until p2 <> '';
	val(p2,c2,codigo2);
until codigo2 > 0;
writeln;
end;//end final del procedimiento

//Procedimiento para la ejecucion del juego completo estructurado
procedure juego;

begin
repeat

DPlayer;
DAliens;
MPlayer;
BPlayer;
MAliens;
until false;
end;//end final del procedimiento

// Comienzo del cuerpo del programa
BEGIN
randomize;
	rdm[1]:= random(2);
		if  rdm[1] = 1 then dir:= 1;
		if  rdm[1] = 0 then dir:= -1;
	rdm[2]:= random(2);
		if  rdm[2] = 1 then dir:= 1;
		if  rdm[2] = 0 then dir:= -1;
	rdm[3]:= random(2);
		if  rdm[3] = 1 then dir:= 1;
		if  rdm[3] = 0 then dir:= -1;
	rdm[4]:= random(2);
		if  rdm[4] = 1 then dir:= 1;
		if  rdm[4] = 0 then dir:= -1;
	rdm[5]:= random(2);
		if  rdm[5] = 1 then dir:= 1;
		if  rdm[5] = 0 then dir:= -1;
	rdm[6]:= random(2);
		if  rdm[6] = 1 then dir:= 1;
		if  rdm[6] = 0 then dir:= -1;
	textcolor(5);
 gotoxy(43,1);writeln('//||=============================||\\ ');
 gotoxy(45,2);writeln ('Bienvenido a SPACE INVADERS A.A.S ');
 gotoxy(43,3);writeln('\\||=============================||//  ');
  writeln ('---------------------------------');
 writeln ('-Presione [enter] para continuar-');
 writeln ('---------------------------------');
 readln();
 clrscr;
 gotoxy(53,1);writeln('//====\\ ');
 gotoxy(54,2);writeln('=MENU=');
 gotoxy(53,3);writeln('\\====// ');
 writeln; 
 gotoxy(40,5);writeln ('---------------------------------');
 gotoxy(50,6);writeln('1-JUGAR');
 gotoxy(40,7);writeln ('---------------------------------');
 gotoxy(50,8);writeln ('2-INTRUCCIONES');
 gotoxy(40,9);writeln ('---------------------------------');
 gotoxy(50,10); writeln('3-CERRAR JUEGO');
 gotoxy(40,11);writeln ('---------------------------------');
 readln (opciones);
 case opciones of
	1:
	begin
	clrscr;
	ppx := 40;
	ppy := 24;
		validacion;
		repeat
		writeln ('///Ingrese su nombre de usuario, puede usar caracteres y numeros:');
		readln (nickname);
		until nickname <> '';
		repeat
		begin
		writeln('¡Bienvenido! ',nickname, ' Eliga el nivel de dificultad para la partida: [1] [2] [3]');
		readln (dificultades);
			case dificultades of
				1: 
				// Durante el desarrollo de la logica se usara todo este case para hacer pruebas sobre el funcionamiento
					begin
					apx[1] := 40; apy[1] := 3; aliens[1] := true;
					apx[2] := 40; apy[2] := 14; aliens[2] := true;
					apx[4] := 40; apy[4] := 18; aliens[4] := true;
						writeln ('usted ha elegido el nivel facil');
						writeln ('Presione [Enter] para empezar');
						readln();
						clrscr;
						//repeat
						juego;
						readln;
						//until false;
					end;
				2:
					begin
						writeln ('usted ha elegido el nivel normal');
					end;
				3:
					begin 
						writeln ('usted ha elegido el nivel de dificultad dificil');
					end;
			end; //end del segundo case
		end;
		until (dificultades=1) or (dificultades=2) or (dificultades=3);
	end; //end de la primera opcion del primer case
	2: 
	begin
	clrscr;
	    gotoxy(37,1);writeln ('-------------------------------------------------------');
		gotoxy(38,2);writeln ('A continuacion se muestran las intrucciones del juego ');
		gotoxy(37,3);writeln ('-------------------------------------------------------');
		gotoxy(8,7);writeln ('/Su objetivo es eliminar oleadas de alienigenas con un canon laser y obtener la mayor cantidad de puntos posible');
		gotoxy(8,8);writeln ('---------------------------------------------------------------------------------------------------------------');
		gotoxy(8,9);writeln ('//Se utilizan las letras <== y ==> (izquierda y derecha) para mover la nave');
		gotoxy(8,10);writeln ('---------------------------------------------------------------------------------------------------------------');
		gotoxy(8,11);writeln ('///Se utiliza la barra espaciadora para disparar el canon laser');
		gotoxy(8,12);writeln ('---------------------------------------------------------------------------------------------------------------');
		gotoxy(8,13);writeln ('////Con la tecla [p] se pausa el juego');
		gotoxy(8,14);writeln ('---------------------------------------------------------------------------------------------------------------');
	    gotoxy(1,15);writeln ('=======================================================================================================================');
		gotoxy(5,16);writeln ('-------------------------------------------------------');
		gotoxy(5,17);writeln('/Para saber sobre los aliens presione 1');
		gotoxy(5,18);writeln ('-------------------------------------------------------');
		gotoxy(5,19);writeln('//Para volver al menu presione 2');
		gotoxy(5,20);writeln ('-------------------------------------------------------');
		gotoxy(5,21);writeln('///Para cerrar el programa presione 3');
		gotoxy(5,22);writeln ('-------------------------------------------------------');
		readln(aliensb);
		case aliensb of 
		1:
			begin
		clrscr;
		
		gotoxy(10,1);writeln('//========\\ ');
		gotoxy(10,2);writeln('Alien basico');
		gotoxy(10,3);writeln('//========\\ ');
		gotoxy(10,5);writeln('I-/.-.\-I');
		gotoxy(50,1);writeln('//==========\\ ');
		gotoxy(50,2);writeln(' Alien Medio');
		gotoxy(50,3);writeln('//==========\\ ');
		gotoxy(50,5);writeln('[=I.<>.I=]');
		gotoxy(90,1);writeln('//========\\ ');
		gotoxy(91,2);writeln('Alien Boss');
		gotoxy(90,3);writeln('//========\\ ');
		gotoxy(87,5);writeln('    |<>/´|´\<>| ');	
		gotoxy(87,5);writeln('--|=(+)|\|/|(+)=|--');	
		gotoxy(87,6);writeln('  /\  ;\,|,/;  /\');	
		gotoxy(87,7);writeln(' /  \         /  \');
			
		
		
		end;
		end;
	end;// end del la segunda opcion  del primer case
	3: writeln ('hasta la proxima, vuelva pronto pronto para mas diversion!');

 end; //end del primer case


END.//end final del cuerpo



[=I.<>.I=]

I-/.-.\-I

       
          |<>/´|´\<>|               
      --|=(+)|\|/|(+)=|--
        /\  ;\,|,/;  /\            
       /  \         /  \

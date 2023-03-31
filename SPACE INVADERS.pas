//||==========================||//
//|| SPACE INVADERS EN PASCAL ||//
//||==========================||//

// Realizado por: Angel Pérez, Abdl Taktak y Samuel Marcano //

program SpaceInvaders;

uses CRT;       //Profe hoy nos reunimos, mi pc anda obstusa  <== Samuel

const
APantalla = 24;
LPantalla = 77;

var {Empieza la declaracion de variables, cada una tiene una funcion especifica para el juego y seran explicadas en un archivo de texto}
scr,fnp,opciones,dificultades,bx,by,ppx,ppy,l,aliensb,repit:integer;
nickname:string;
aliens: array[1..6] of boolean;
BActivo,AActivo: boolean;
apy: array[1..6] of integer;
apx: array[1..6] of integer;
rdm: array[1..6] of integer;
dir: array[1..6] of integer;

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
				  ppx := (LPantalla - 5);		
				  DPlayer;	
			end;//end del case #77
		end;//end del case
	end; //end del if
end; //end final del procedimiento

//Procedimiento para dibujar aliens
procedure DAliens;
var i: integer;
Begin

	for i:= 1 to 6 do
	begin
		
		gotoxy(apx[i], apy[i]);
		
		if (aliens[i] = true) and (i = 1) then
		begin textcolor(4);
			writeln('--|=(+)|\|/|(+)=|--');
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

//Procedimiento para el movimiento de la bala en pantalla
procedure MBullet;
begin

while (BActivo and (by > 1)) do
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
        if by = 1 then
        begin
        gotoxy(bx, by);
		writeln('    ');
		end;
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

//Procedimiento para mover aliens
procedure MAliens;
var i:integer;
begin

while AActivo = true do
begin
delay(50);
	for i:= 1 to 6 do
	begin
	if dir[i] = 1 then
	begin
	
	if i = 1 then
	begin
			gotoxy(apx[i],apy[i]);
			write('                   ');
			apx[i] := apx[i] + 1;
			if apx[i] > (LPantalla - 19) then
			begin
				  apx[i] := (LPantalla - 19);
				  dir[i] := -1;
				  apx[i] := apx[i];
			end;	  	
	end;
	
	if (i >= 2) and (i < 4) then
	begin
			gotoxy(apx[i],apy[i]);
			write('                   ');
			apx[i] := apx[i] + 1;
			if apx[i] > (LPantalla - 10) then
			begin
				  apx[i] := (LPantalla - 10);
				  dir[i] := -1;
				  apx[i] := apx[i];
			end;	  	
	end;
	
	if i >= 4 then
	begin
	
			gotoxy(apx[i],apy[i]);
			write('                   ');
			apx[i] := apx[i] + 1;
			if apx[i] > (LPantalla - 10) then
			begin
				  apx[i] := (LPantalla - 9);
				  dir[i] := -1;
				  apx[i] := apx[i];
			end;	  	
	end;
	end;
	
	if dir[i] = -1 then
	begin
	if i = 1 then
	begin
	
			gotoxy(apx[i],apy[i]);
			write('                   ');
			apx[i] := apx[i] - 1;
			if apx[i] < 1 then
			begin
				  apx[i] := 1;
				  dir[i] := 1;
				  apx[i] := apx[i];
			end;	  	
	end;
	
	if (i >= 2) and (i < 4) then
	begin
	
			gotoxy(apx[i],apy[i]);
			write('                   ');
			apx[i] := apx[i] - 1;
			if apx[i] < 1 then
			begin
				  apx[i] := 1;
				  dir[i] := 1;
				  apx[i] := apx[i];
			end;	  	
	end;
	
	if i >= 4 then
	begin
	
			gotoxy(apx[i],apy[i]);
			write('                   ');
			apx[i] := apx[i] - 1;
			if apx[i] < 1 then
			begin
				  apx[i] := 1;
				  dir[i] := 1;
				  apx[i] := apx[i];
			end;	  	
	end;
	end;
	end;
	DAliens;
	BPlayer;
	MPlayer;
	end;
	
end; //end del procedimiento

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
	gotoxy(15,1);write ('///introduzca su nombre:');
	readln(p1);
	until p1 <> '';
	val (p1,c1,codigo1);
until codigo1>0;
repeat
	repeat
	gotoxy(17,3);write('////introduzca su apellido:');
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
MAliens;
MPlayer;
BPlayer;

until false;
end;//end final del procedimiento

// Comienzo del cuerpo del programa
BEGIN

by := 0;

randomize;
	rdm[1]:= random(2);
		if  rdm[1] = 1 then dir[1]:= 1;
		if  rdm[1] = 0 then dir[1]:= -1;
	rdm[2]:= random(2);
		if  rdm[2] = 1 then dir[2]:= 1;
		if  rdm[2] = 0 then dir[2]:= -1;
	rdm[3]:= random(2);
		if  rdm[3] = 1 then dir[3]:= 1;
		if  rdm[3] = 0 then dir[3]:= -1;
	rdm[4]:= random(2);
		if  rdm[4] = 1 then dir[4]:= 1;
		if  rdm[4] = 0 then dir[4]:= -1;
	rdm[5]:= random(2);
		if  rdm[5] = 1 then dir[5]:= 1;
		if  rdm[5] = 0 then dir[5]:= -1;
	rdm[6]:= random(2);
		if  rdm[6] = 1 then dir[6]:= 1;
		if  rdm[6] = 0 then dir[6]:= -1;
	textcolor(5);
 gotoxy(43,1);writeln('//||=============================||\\ ');
 gotoxy(45,2);writeln ('Bienvenido a SPACE INVADERS A.A.S ');
 gotoxy(43,3);writeln('\\||=============================||//  ');
 writeln ('---------------------------------');
 writeln ('-Presione [enter] para continuar-');
 writeln ('---------------------------------');
 readln();
 clrscr;
repeat
 repeat
 clrscr;
 gotoxy(53,1);writeln('//====\\ ');
 gotoxy(54,2);writeln('=MENU=');
 gotoxy(53,3);writeln('\\====// ');
 writeln; 
 textcolor(15);
 gotoxy(53,22);writeln('<|A|>');
 textcolor(8);
 gotoxy(55,17);writeln('|');
 textcolor(3);
 gotoxy(51,15);writeln('[=I.<>.I=]');
 textcolor(5);
 gotoxy(40,5);writeln ('---------------------------------');
 gotoxy(50,6);writeln('1-JUGAR');
 gotoxy(40,7);writeln ('---------------------------------');
 gotoxy(50,8);writeln ('2-INTRUCCIONES');
 gotoxy(40,9);writeln ('---------------------------------');
 gotoxy(50,10); writeln('3-CERRAR JUEGO');
 gotoxy(40,11);writeln ('---------------------------------');
 readln (opciones);
 until (opciones=1) or (opciones=2) or (opciones=3);
 case opciones of
	1:
	begin
	clrscr;
	ppx := 40;
	ppy := 24;
		validacion;
		repeat
		gotoxy(19,5);write ('/////Ingrese su nombre de usuario, puede usar caracteres y numeros:');
		readln (nickname);
		until nickname <> '';
		repeat
		begin
		clrscr;
		gotoxy(28,1);writeln('Bienvenido [',nickname, '] Eliga el nivel de dificultad para la partida: ');
		gotoxy(8,3);writeln(' 1- Facil, esta es una dificultad sencila para jugadores nuevos');
		gotoxy(10,5);writeln(' 2- Medio , este es un poco mas demandante para jugadores mas experimentados');
		gotoxy(12,7);writeln(' 3- Extremo, alta dificultad para jugadores que buscan un reto');
		readln (dificultades);
			case dificultades of
				1: 
				// Durante el desarrollo de la logica se usara todo este case para hacer pruebas sobre el funcionamiento
					begin 
					clrscr;
					AActivo := true;
					apx[1] := 40; apy[1] := 2; aliens[1] := true;
					apx[2] := 40; apy[2] := 9; aliens[2] := true;
					apx[4] := 40; apy[4] := 18; aliens[4] := true;
						gotoxy(35,1);writeln ('Usted ha elegido el nivel facil');
						writeln ('///Presione [Enter] para empezar');
						readln();
						clrscr;
						juego;
						readln;
						
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
		gotoxy(87,5);writeln('--|=(+)|\|/|(+)=|--');	

		end;// end de la opcion unoh
		2:
		begin
		end; //end de l opcion doh
		end; //end case aliensb
		
	end;// end del la segunda opcion  del primer case
	3: writeln ('hasta la proxima, vuelva pronto pronto para mas diversion!');

 end; //end del primer case

until aliensb <> 2;

END.//end final del cuerpo

//||==========================||//
//|| SPACE INVADERS EN PASCAL ||//
//||==========================||//

// Realizado por: Angel Pérez, Abdl Taktak y Samuel Marcano //

program SpaceInvaders;

uses CRT;

var {Empieza la declaracion de variables, cada una tiene una funcion especifica para el juego y seran explicadas en un archivo de texto}

scr,fnp,opciones,dificultades,bx,by,ppx,ppy,dir:integer;
nickname:string;
aliens: array[1..6] of boolean;
BActivo: boolean;
apy: array[1..6] of integer;
apx: array[1..6] of integer;

//Procedimiento para mostrar al jugador en pantalla
procedure DPlayer;
begin
gotoxy(ppx,ppy);
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
				if ppx > 77 then
				  ppx := 77;		
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
		writeln('');

	end;

end;

//Procedimiento para mover aliens
procedure MAliens;
begin

	
 
end; //end del procedimiento

//Procedimiento para el movimiento del jugador en pantalla 
procedure MBullet;
begin
while (BActivo and (by > 1))  do
        begin
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
	writeln ('introduzca su nombre:');
	readln(p1);
	until p1 <> '';
	val (p1,c1,codigo1);
until codigo1>0;
repeat
	repeat
	writeln('introduzca su apellido');
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
MPlayer;
BPlayer;
MAliens;
until false;
end;//end final del procedimiento

// Comienzo del cuerpo del programa
BEGIN

 writeln ('Bienvenido a SPACE INVADERS A.A.S');
 writeln ('presione [enter] para continuar');
 readln();
 writeln('MENU');
 writeln; 
 writeln('1-JUGAR');
 writeln ('2-INTRUCCIONES');
 writeln('3-CERRAR JUEGO');
 readln (opciones);
 case opciones of
	1:
	begin
	ppx := 40;
	ppy := 24;
		validacion;
		writeln ('Ingrese su nombre de usuario, puede usar caracteres y numeros:');
		readln (nickname);
		writeln('¡Bienvenido! ',nickname, ' Eliga el nivel de dificultad para la partida: [1] [2] [3]');
		readln (dificultades);
			case dificultades of
				1: 
				// Durante el desarrollo de la logica se usara todo este case para hacer pruebas sobre el funcionamiento
					begin
					
						writeln ('usted ha eligido el nivel facil');
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
		
	end; //end de la primera opcion del primer case
	2: 
	begin
		writeln ('A continuacion se muestran las intrucciones del juego: ');
		writeln ('Su objetivo es eliminar oleadas de alienigenas con un canon laser y obtener la mayor cantidad de puntos posible');
		writeln ('Se utilizan las letras <== y ==> (izquierda y derecha) para mover la nave');
		writeln ('Se utiliza la barra espaciadora para disparar el canon laser');
		writeln ('Con la tecla [p] se pausa el juego');
	end;// end del la segunda opcion  del primer case
	3: writeln ('hasta la proxima, vuelva pronto pronto para mas diversion!');

 end; //end del primer case


END.//end final del cuerpo

//||==========================||//
//|| SPACE INVADERS EN PASCAL ||//
//||==========================||//

// Realizado por: Angel Pérez, Abdl Taktak y Samuel Marcano //

program SpaceInvaders;

uses CRT;

var {Empieza la declaracion de variables, cada una tiene una funcion especifica para el juego y seran explicadas en un archivo de texto}

scr,fnp,opciones,dificultades:integer;
nickname:string;
ppx,ppy,apx,apy:integer;
aliens: array[1..10, 1..10] of string;
balas: array[1..5,1..5] of string;

//funcion para mostrar al jugador en pantalla

procedure DPlayer;
begin
gotoxy(ppx,ppy);
write('<|A|>');
end;




//funcion para la validacion del nombre y apellido

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
	writeln ('introduzca su nombre:');
	readln(p1);
	val (p1,c1,codigo1);
until codigo1>0;
repeat
	writeln('introduzca su apellido');
	readln (p2);
	val(p2,c2,codigo2);
until codigo2 > 0;
writeln;
end;


procedure juego;

begin
DPlayer;
end;

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
		writeln ('Ingrese su nombre de usuario, puede usar caracteres y numeres:');
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
		writeln ('A constinuacion se muestran las intrucciones del juego: ');
		writeln ('Su objetivo es eliminar oleadas de alienigenas con un canon laser y obtener la mayor cantidad de puntos posible');
		writeln ('Se utilizan las flechas direcionales <-- y --> (izquierda y derecha) para mover la nave');
		writeln ('Se utiliza la barra espaciadora para disparar el canon laser');
		writeln ('Con la tecla [p] se pausa el juego');
	end;// end del la segunda opcion  del primer case
	3: writeln ('hasta la proxima, vuelva pronto pronto para mas diversion!');

 end; //end del primer case


END.//end final del cuerpo

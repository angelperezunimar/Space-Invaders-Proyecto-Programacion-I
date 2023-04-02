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
scr, fnp, opciones, dificultades, bx, by, ppx, ppy, l, aliensb, repit,bxa,bya, VJugador,RDisparo,RValor:integer;
nickname:string;
aliens: array[1..6] of boolean;
BActivo,AActivo,JActivo: boolean;
apy: array[1..6] of integer;
apx: array[1..6] of integer;
rdm: array[1..6] of integer;
dir: array[1..6] of integer;
ABActivo: array[1..6] of boolean; // nuevo arreglo para representar el estado de la bala del alien

//Procedimiento para mostrar al jugador en pantalla
procedure DPlayer;
begin
if VJugador = 0 then JActivo := false;
if JActivo = true and ((aliens[1] = true) or (aliens[2] = true) or (aliens[3] = true) or (aliens[4] = true) or (aliens[5] = true) or (aliens[6] = true)) then
begin
gotoxy(ppx,ppy);
textcolor(15);
write('<|A|>');
end;
end; //end final del procedimiento

//Procedimiento para el movimiento del jugador en pantalla 
procedure MPlayer;
begin
if keypressed then
    begin
      case readkey of
		#75:
			begin
			sound(900000);
	delay(50);
	nosound;
	read;
				gotoxy(ppx,ppy);
				writeln('      ');
				ppx := ppx - 1;
				if ppx < 3 then
				  ppx := 2;
				  DPlayer;
			end;//end del case #75
			
		#77:
			begin
			sound(900000);
	delay(50);
	nosound;
	read;
			gotoxy(ppx,ppy);
				writeln('     ');
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


	end; //end del bucle for

end;

//Procedimiento para el movimiento de la bala en pantalla
procedure MBullet;
var i: integer;
begin
  while ((BActivo = true) and (by > 2) and (JActivo = true)) and ((aliens[1] = true) or (aliens[2] = true) or (aliens[3] = true) or (aliens[4] = true) or (aliens[5] = true) or (aliens[6] = true)) do
  begin
 
    textcolor(8);
    delay(50);
    gotoxy(bx, by);
    writeln('   ');
    by := by - 1;
    gotoxy(bx, by);
    writeln('  |');
    MPlayer;
    for i := 1 to 6 do // verificación de impacto
    begin
    if i = 1 then
    begin
      if (aliens[i] = true) and ((bx = apx[i] + 1) or (bx = apx[i] + 2) or (bx = apx[i] + 3) or (bx = apx[i] + 4) or (bx = apx[i] + 5) or (bx = apx[i] + 6) or (bx = apx[i] + 7) or (bx = apx[i] + 8) or (bx = apx[i] + 9) or (bx = apx[i] + 10) or (bx = apx[i] + 11) or (bx = apx[i] + 12) or (bx = apx[i] + 13) or (bx = apx[i] + 14) or (bx = apx[i] + 15) or (bx = apx[i] + 16) or (bx = apx[i] + 17) or (bx = apx[i] + 18) or (bx = apx[i] + 19)) and (by = apy[i] + 2) then
      begin
        aliens[i] := false;
        gotoxy(apx[i], apy[i]);
        write('             ');
      end; //end del if
     end;
     if (i >= 2) and (i < 4) then
     begin
      if (aliens[i] = true) and ((bx = apx[i] + 1) or (bx = apx[i] + 2) or (bx = apx[i] + 3) or (bx = apx[i] + 4) or (bx = apx[i] + 5) or (bx = apx[i] + 6) or (bx = apx[i] + 7) or (bx = apx[i] + 8) or (bx = apx[i] + 9) or (bx = apx[i] + 10)) and (by = apy[i]) then
      begin
        aliens[i] := false;
        gotoxy(apx[i], apy[i]);
        write('             ');
      end; //end del if
     end;
     
     if (i >= 4) then
     begin
      if (aliens[i] = true) and ((bx = apx[i]) or (bx = apx[i] + 1) or (bx = apx[i] + 2) or (bx = apx[i] + 3) or (bx = apx[i] + 4) or (bx = apx[i] + 5) or (bx = apx[i] + 6) or (bx = apx[i] + 7) or (bx = apx[i] + 8) or (bx = apx[i] + 9)) and (by = apy[i]) then
      begin
        aliens[i] := false;
        gotoxy(apx[i], apy[i]);
        write('             ');
      end; //end del if
      end;
      
    end;// end del bucle for
  end; // end del bucle while
  BActivo := False;
  if by = 2 then
  begin
    gotoxy(bx,by);
    writeln('    ');
  end; //end del if
  // actualización de aliens
  for i := 1 to 6 do
  begin
    if (aliens[i] = true) and (bx = apx[i] + 5) and (by <= apy[i] + 2) and (by >= apy[i]) then
    begin
      aliens[i] := false;
      gotoxy(apx[i], apy[i]);
      write('             ');
    end; // end del if
  end; //end del bucle for
end; //end final del procedimiento

//Procedimiento para el movimiento del jugador en pantalla 
procedure BPlayer;
begin
BActivo := False;
if keypressed then
begin
if JActivo = true and ((aliens[1] = true) or (aliens[2] = true) or (aliens[3] = true) or (aliens[4] = true) or (aliens[5] = true) or (aliens[6] = true)) then
begin
	if readkey = #32 then // barra espaciadora
	begin
	sound(1200);
	delay(150);
	nosound;
	read;
		bx := ppx;
        by := ppy;
        BActivo := True;
        writeln('|');
        MBullet;
        
	end;//end del if
	end;
	end;
end;//end final del procedimiento

procedure ADisparo;
var
  i, r: integer;
  begin
  if (JActivo = true) and ((aliens[1] = true) or (aliens[2] = true) or (aliens[3] = true) or (aliens[4] = true) or (aliens[5] = true) or (aliens[6] = true))then
begin
randomize;
RDisparo:= random(RValor) + random(RValor);
  r := random(6) + RDisparo; //elegir un alien aleatorio para disparar
  if (aliens[r] = true) and (apy[r] > 0) then // comprobar que el alien está vivo y dentro de la pantalla
  begin
    bya := apy[r] + 3; //posición inicial de la bala del alien
    while (bya < APantalla) and (aliens[r] = true) do // mover la bala hacia abajo hasta que impacte en un jugador o llegue al borde inferior de la pantalla
    begin
      delay(100);
      gotoxy(apx[r] + 5, bya); //borrar la posición anterior de la bala
      writeln(' ');
      bya := bya + 1; //actualizar la posición vertical de la bala
      gotoxy(apx[r] + 5, bya); //dibujar la nueva posición de la bala
      writeln('|');
      bxa:= apx[r] + 5;
      // comprobar colisión con el jugador
		if ((bxa = ppx + 2) or (bxa = ppx + 3) or (bxa = ppx + 4)) and (bya = ppy) then VJugador:= VJugador - 1;
      MPlayer; // comprobar si la bala impacta en el jugador
    end;
    gotoxy(apx[r] + 5, bya);
    writeln(' ');
  end;
  end;
end;

//Procedimiento para mover aliens
procedure MAliens;
var i:integer;
begin

while (AActivo = true) and (JActivo = true) and ((aliens[1] = true) or (aliens[2] = true) or (aliens[3] = true) or (aliens[4] = true) or (aliens[5] = true) or (aliens[6] = true)) do
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
			if apx[i] < 2 then
			begin
				  apx[i] := 2;
				  dir[i] := 1;
				  apx[i] := apx[i];
			end;	  	
	end;
	
	if (i >= 2) and (i < 4) then
	begin
	
			gotoxy(apx[i],apy[i]);
			write('                   ');
			apx[i] := apx[i] - 1;
			if apx[i] < 2 then
			begin
				  apx[i] := 2;
				  dir[i] := 1;
				  apx[i] := apx[i];
			end;	  	
	end;
	
	if i >= 4 then
	begin
	
			gotoxy(apx[i],apy[i]);
			write('                   ');
			apx[i] := apx[i] - 1;
			if apx[i] < 2 then
			begin
				  apx[i] := 2;
				  dir[i] := 1;
				  apx[i] := apx[i];
			end;	  	
	end;
	end;
	end;
	DAliens;
	BPlayer;
	MPlayer;
	ADisparo;
	end;
	
end; //end del procedimiento

//Procedimiento para la validacion del nombre y apellido
procedure validacion;
var
p1,p2:string;
c1,c2,codigo1,codigo2:integer;
begin
c1:=0;
c2:=0;
repeat
	repeat
	gotoxy(15,1);write ('///introduzca su nombre:');
	readln(p1);
	until p1 <> ''; //final del repeat interno (para no romper el juego colocando un espacio en blanco)
	val (p1,c1,codigo1);
until codigo1>0; // final del repat
repeat
	repeat
	gotoxy(17,3);write('////introduzca su apellido:');
	readln (p2);
	until p2 <> ''; //final del repeat interno
	val(p2,c2,codigo2);
until codigo2 > 0; //final del repeat
writeln;
end;//end final del procedimiento

//Procedimiento para dibujar la pantalla principal
procedure DPantalla;
var i,j: integer;
Begin
textcolor(15);
clrscr;

for i:=1 to APantalla do
begin
gotoxy(1,i);
writeln('|');
gotoxy(LPantalla,i);
writeln('|');
end;

for i:=1 to LPantalla do
begin
gotoxy(i,1);
writeln('-');
gotoxy(i,APantalla + 1);
writeln('-');
end;

gotoxy(LPantalla+1,1);
writeln('SPACE INVADERS');
gotoxy(LPantalla+1,3);
writeln('Vidas: ', VJugador);
gotoxy(LPantalla+1,5);
writeln('Nickname: ',nickname);

end;

//Procedimiento para la ejecucion del juego completo estructurado
procedure juego;

begin
repeat
DPantalla;
DPlayer;
DAliens;
MAliens;
MPlayer;
BPlayer;

until (JActivo = false) or ((aliens[1] = false) and (aliens[2] = false) and (aliens[3] = false) and (aliens[4] = false) and (aliens[5] = false) and (aliens[6] = false));
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
	 gotoxy(1,1);writeln('======================================================================================================================== ');
	 gotoxy(1,28);writeln('========================================================================================================================');
	 gotoxy(43,11);writeln('//||=============================||\\ ');
	 gotoxy(45,12);writeln ('Bienvenido a SPACE INVADERS A.A.S ');
	 gotoxy(43,13);writeln('\\||=============================||//  ');
	delay(3000);
	read;
	 writeln ('---------------------------------');
	 writeln ('-Presione [enter] para continuar-');
	 writeln ('---------------------------------');
	 read();
	 clrscr;
			repeat //repeat para regresar al menu principal luego de ver las instrucciones
				repeat // repeat para elegir solo las opciones jugar, instrucciones o cerrar juego
					 clrscr;
					 gotoxy(1,28);writeln('========================================================================================================================');
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
					 sound(70000);
							delay(100);
							nosound;
							read;
				until (opciones=1) or (opciones=2) or (opciones=3); //fin del repeat para elegir las opciones de jugar, instrucciones o cerrar juego
	 case opciones of
		1:
		begin
			clrscr;
			ppx := 40;
			ppy := 24;
			validacion;
				repeat
					gotoxy(1,28);writeln('========================================================================================================================');
					gotoxy(19,5);write ('/////Ingrese su nombre de usuario, puede usar caracteres y numeros:');
					readln (nickname);
				until nickname <> ''; //este repeat es para evitar romper el programa con un espacio en blanco
				
			repeat //repeat para elegir algunas de las dificultades
					begin
						clrscr;
						gotoxy(1,28);writeln('========================================================================================================================');
						gotoxy(28,1);writeln('Bienvenido [',nickname, '] Eliga el nivel de dificultad para la partida: ');
						gotoxy(8,3);writeln(' 1- Facil, esta es una dificultad sencila para jugadores nuevos');
						gotoxy(10,5);writeln(' 2- Normal , este es un poco mas demandante para jugadores mas experimentados');
						gotoxy(12,7);writeln(' 3- Dificil, alta dificultad para jugadores que buscan un reto');
							sound(70000);
							delay(100);
							nosound;
							read;
						readln (dificultades);
							case dificultades of
								1: 
								// Durante el desarrollo de la logica se usara todo este case para hacer pruebas sobre el funcionamiento
									begin 
										clrscr;
										AActivo := true;
										VJugador:= 1;
										JActivo:= true;
										RValor:= 8;
										apx[1] := 40; apy[1] := 2; aliens[1] := true;
										apx[2] := 40; apy[2] := 9; aliens[2] := true;
										apx[4] := 40; apy[4] := 17; aliens[4] := true;
										gotoxy(35,1);writeln ('=Usted ha elegido el nivel facil=');
										delay(200);
										gotoxy(35,3);writeln ('Preparece para jugar en:');
										delay(100);
										gotoxy(35,5);writeln ('3');
										delay(1000);
										gotoxy(35,7);writeln ('2');
										delay(1000);
										gotoxy(35,9);writeln ('1');
										delay(1000);
										read();
										clrscr;
										juego;
										clrscr; 
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
							
				end; // end que engloba al repeat
				
			until (dificultades=1) or (dificultades=2) or (dificultades=3 )// final del repeat para elegir la dificultad
			
		end; //end de la primera opcion del primer case
		
		2: 
		begin
			repeat // repat para volver a las instrucciones
				 begin
					clrscr;
						gotoxy(1,28);writeln('========================================================================================================================');
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
						sound(70000);
							delay(100);
							nosound;
							read;
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
							writeln('');
							Writeln('=============================================================================================================');
							writeln ('presione la tecla [1] para regresar a las intrucciones');
							readln(repit);
							sound(70000);
							delay(100);
							nosound;
							read;
							clrscr;
							gotoxy(1,30);writeln('Cargando...');
							delay(3000);
							read;
						end;// end de la opcion unoh
					end; //end case aliensb
					
					
					
				end;//end que engloba al repit
			until (repit<>1); // final del repeat para volver a las instrucciones
			clrscr;
		end;// end del la segunda opcion  del primer case
		
		3: writeln ('hasta la proxima, vuelva pronto pronto para mas diversion!'); 

	 end; //end del primer case

		until aliensb <> 2; //final del repeat para volver al menu principal luego de ver las instrucciones

END.//end final del cuerpo

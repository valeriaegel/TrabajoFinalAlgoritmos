unit manejo_Arboles;

interface
  USES
    manejo_archivo_cont;
  procedure leer_clave(var x:string; var clave:string);
  PROCEDURE CONSULTA(VAR ARBOL_DNI:T_PUNT; VAR ARBOL_AYN:T_PUNT; var pos:CARDINAL);
  PROCEDURE BUSCAR (ARBOL:T_PUNT);
  PROCEDURE MUESTRA_DATOS (ARCH_C:ARCHIVO_C; ARBOL: T_PUNT);
  FUNCTION PREORDEN( ARBOL:T_PUNT;BUSCADO:CHAR):T_PUNT;
  PROCEDURE AGREGAR_NODO (VAR ARBOL:T_PUNT);
  PROCEDURE LISTAR (ARBOL:T_PUNT);
  PROCEDURE SUPRIMIR_NODO (VAR ARBOL:T_PUNT);
  PROCEDURE ELIMINA_NODO(ARBOL:T_PUNT;BUSCADO:STRING);
 
implementation
    procedure leer_clave(var x:string; var clave:string);
    begin
    Writeln ('Va a ingresar un NOMBRE o un DNI?')
    Readln (x);
    Writeln ('Ingrese CLAVE');
    Readln (CLAVE);
    end;

PROCEDURE CONSULTA(ARBOL; var pos:CARDINAL);
VAR 
  AUX:T_PUNT;
begin
  POS:=-1;
  
    AUX:= PREORDEN(ARBOL, CLAVE);
  IF AUX<>NIL THEN
    POS:= AUX^.INFO.POS_ARCH;
  end;
end;

 PROCEDURE BUSCAR (ARBOL:T_PUNT);
 BEGIN
 IF ARBOL_VACIO (ARBOL) THEN 
  WRITE ('ARBOL VACIO')
 ELSE 
  CONSULTA(ARBOL_DNI; ARBOL_AYN; POS);
 end;

PROCEDURE MUESTRA_DATOS (VAR ARCH_C:ARCHIVO_C; ARBOL: T_PUNT);
VAR
  X:WORD;
BEGIN
X:= ARBOL^.INFO.POS_ARCH;
MOSTRAR_DATOS_C(arch_c,x);
END;

FUNCTION PREORDEN(ARBOL:T_PUNT; BUSCADO:STRING[100]):T_PUNT;
BEGIN
IF (ARBOL = NIL) THEN PREORDEN := NIL
ELSE
  IF ( ARBOL^.INFO = BUSCADO) THEN
    PREORDEN:= ARBOL
  ELSE IF ARBOL^.INFO > BUSCADO THEN
    PREORDEN := PREORDEN(ARBOL^.H_I,BUSCADO)
  ELSE
    PREORDEN := PREORDEN(ARBOL^.H_D,BUSCADO)
END;

PROCEDURE AGREGAR_NODO (VAR ARBOL:T_PUNT);
VAR
X:CHAR;
BEGIN
CLRSCR;
WRITE ('INGRESE DATO: ');
READLN (X);
AGREGAR(ARBOL, X);
end;

PROCEDURE LISTAR (ARBOL:T_PUNT);
BEGIN
IF NOT ARBOL_VACIO (ARBOL) THEN INORDEN (ARBOL)
ELSE WRITELN ('ARBOL VACIO');
READKEY
END;

PROCEDURE SUPRIMIR_NODO (VAR ARBOL:T_PUNT);
VAR
 ANT, TEMP: T_PUNT;
BEGIN
  TEMP:= ARBOL;
  IF ARBOL^.H_D = nil THEN
    ARBOL:=ARBOL^.H_I
  ELSE
    IF ARBOL^.H_I = nil THEN
      ARBOL:= ARBOL^.H_D
    ELSE
    BEGIN
      TEMP:= ARBOL^.H_I;
      ANT:= ARBOL;
      WHILE TEMP^.H_D <> nil DO
      BEGIN
        ANT:= TEMP;
        TEMP:= ARBOL^.H_D;
      end;
      ARBOL^.INFO:= TEMP^.INFO;
      IF ANT = ARBOL THEN
        ANT^.H_I:= TEMP^.H_I
      ELSE
        ANT^.H_D:= TEMP^.H_I;
    end;
    DISPOSE (TEMP);
end; 
  
PROCEDURE ELIMINA_NODO(ARBOL:T_PUNT;BUSCADO:STRING);
VAR
  ARBOL1:T_PUNT;
BEGIN
  ARBOL1:= PREORDEN (ARBOL,BUSCADO);
  SUPRIMIR_NODO (ARBOL1);
end;


end.
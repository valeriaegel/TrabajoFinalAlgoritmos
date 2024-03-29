unit manejo_contribuyentes;

interface
   USES manejo_archivo_cont,
    manejo_Arboles,  Arboles, DEFINICION_DATOS,
    MANEJO_TERRENOS;

  PROCEDURE ALTA_C(var ARCH_C: ARCHIVO_C; VAR ARBOL_AYN:T_PUNT_A; VAR ARBOL_DNI:T_PUNT_A);
  PROCEDURE MODIF_DATO_C(VAR ARCH_C: ARCHIVO_C; POS:CARDINAL; VAR REG:DATOS_CONT);
  procedure MODIFICACION_C(VAR ARCH_C:ARCHIVO_C; POS:CARDINAL);
  PROCEDURE BAJA(VAR ARCH_C:ARCHIVO_C; POS:CARDINAL );
  PROCEDURE RECUP_ARCH_DNI (VAR ARCH_C:ARCHIVO_C; VAR ARBOL:T_PUNT_A);
  PROCEDURE RECUP_ARCH_AYN (VAR ARCH_C:ARCHIVO_C; VAR ARBOL:T_PUNT_A);

implementation
   PROCEDURE ALTA_C(var ARCH_C: ARCHIVO_C; VAR ARBOL_AYN:T_PUNT_A; VAR ARBOL_DNI:T_PUNT_A);
    var
        AUX_X,AUX_Y:T_DATO_ARBOL;
        R:DATOS_CONT;
        POS:CARDINAL;
    begin
      CARGAR_CONT(R);
      POS:=FILESIZE(ARCH_C);
      GUARDA_DATO_C (ARCH_C,POS,R);
      AUX_X.CLAVE:= CONCAT(R.APELLIDO, R.NOMBRE);
      AUX_Y.CLAVE:= (R.DNI);
      AUX_X.POS_ARCH:= POS;
      AUX_Y.POS_ARCH:= POS;
      AGREGAR_ARBOL(ARBOL_AYN, AUX_X);
      AGREGAR_ARBOL(ARBOL_DNI, AUX_Y);
    end;

    PROCEDURE MODIF_DATO_C(VAR ARCH_C: ARCHIVO_C; POS:CARDINAL; VAR REG:DATOS_CONT);
    VAR
        OP:BYTE;
        OP_2:string[2];
        AUX:string[50];
        AUX_2:BYTE;
    begin
      LEER_DATO_C(ARCH_C,POS,REG);
      Writeln ('¿Que dato desea modificar? (Ingrese nro. de dato o ingrese 0 para volver al menu)');
      Readln (OP);
      CASE OP OF
        1: BEGIN
        Writeln ('Desea modificar nro. de contribuyente? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.N_CONT:= AUX;
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS,REG);
            END;
        2:BEGIN
          Writeln ('Desea modificar nombre? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.NOMBRE:= AUX;
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
            END;
        3:BEGIN
          Writeln ('Desea modificar apellido? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.APELLIDO:= AUX;
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
            END;
        4:BEGIN
          Writeln ('Desea modificar dirección? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.DIREC:= AUX;
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
           END;
        5:BEGIN
          Writeln ('Desea modificar ciudad? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.CIUDAD:= AUX;
            END
           ELSE
            MODIF_DATO_C (ARCH_C,POS, REG);
           END;
        6: BEGIN
          Writeln ('Desea modificar DNI? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.DNI:= AUX;
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
            END;
        7: BEGIN
          Writeln ('Desea modificar fecha de nacimiento? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.F_NAC:= AUX;
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
        END;

        8:BEGIN
          Writeln ('Desea modificar nro. de telefono? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.TEL:= AUX;
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
            END;
        9:BEGIN
          Writeln ('Desea modificar direccion de e-mail? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.MAIL:= AUX;
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
            END;
        10: BEGIN
          Writeln ('Desea modificar estado de contribuyente? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese 1:ACTIVO o 0:INACTIVO');
            Readln (AUX_2);
            IF AUX_2=0 THEN
            REG.ESTADO:= FALSE
            ELSE
            IF AUX_2=1 THEN
            REG.ESTADO:=TRUE;
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
      END;
        END;
    end;

    procedure MODIFICACION_C(VAR ARCH_C:ARCHIVO_C; POS:CARDINAL);
    VAR DATO:DATOS_CONT;
    begin
      MOSTRAR_DATOS_C(ARCH_C, POS);
      MODIF_DATO_C (ARCH_C, POS, DATO);
      GUARDA_DATO_C(ARCH_C, POS, DATO);
    end;

    PROCEDURE BAJA(VAR ARCH_C:ARCHIVO_C; POS:CARDINAL);
    VAR
        OP:STRING; reg:DATOS_CONT; X:STRING[8];
    begin
      MOSTRAR_DATOS_C(ARCH_C, POS);
      Writeln('Desea dar de baja a este contribuyente? (si/no)');
      Readln (OP);
      IF (OP='SI') OR (OP='Si') or (OP='si') then
      begin
        READ(ARCH_C, REG);
        REG.ESTADO:= FALSE;
        WRITE(ARCH_C,REG);
        X:=REG.N_CONT;
        BAJA_CONT_TER ( ARCH_T, X);
      end;
    end;

PROCEDURE RECUP_ARCH_DNI (VAR ARCH_C:ARCHIVO_C; VAR ARBOL:T_PUNT_A);      // ANTES VERIFICAR QUE EXISTA EL ARCHIVO
   VAR
       POS:CARDINAL;
       AUX:DATOS_CONT;
       AUX_X:T_DATO_ARBOL;
   begin
       POS:=0;
       crear_abrir_C(ARCH_C);
       WHILE NOT(EOF(ARCH_C)) DO
       begin
           LEER_DATO_c(ARCH_C,POS,AUX);
           AUX_X.CLAVE:= AUX.DNI;
           AUX_X.POS_ARCH:= POS;
           AGREGAR_ARBOL(ARBOL, AUX_X);
           POS:= POS+1;
       end;
   end;

   PROCEDURE RECUP_ARCH_AYN (VAR ARCH_C:ARCHIVO_C; VAR ARBOL:T_PUNT_A);      // ANTES VERIFICAR QUE EXISTA EL ARCHIVO
   VAR
       POS:CARDINAL;
       AUX:DATOS_CONT;
       AUX_X:T_DATO_ARBOL;
   begin
       POS:=0;
       crear_abrir_C(ARCH_C);
       WHILE NOT(EOF(ARCH_C)) DO
       begin
           LEER_DATO_c(ARCH_C,POS,AUX);
           AUX_X.CLAVE:= CONCAT(AUX.APELLIDO, AUX.NOMBRE);
           AUX_X.POS_ARCH:= POS;
           AGREGAR_ARBOL(ARBOL, AUX_X);
           POS:= POS+1;
       end;
   end;
end.

DECLARE
    TYPE arr_nombres IS ARRAY(15)
            OF VARCHAR2(50);
    v_nombre arr_nombres;
BEGIN
    v_nombre := arr_nombres('Sebastian', 'David', 'Alejandro','Maria','Marcelo');
    
    FOR i in 1..v_nombres.COUNT
    LOOP
        dbms_output.put_line(v_nombres(i));
    END LOOP;
END;
-----------------------------------------------------------------------
DECLARE 
    TYPE arr_nombres IS VARRAY(50)
        OF VARCHAR2(50);
    v_nombrescliente arr_nombres := arr_nombres();
    v_contador number := 1;
BEGIN
    FOR fila IN (SELECT nombre_cliente FROM Cliente)
    LOOP
    v_nombrescliente.EXTEND;
    
    v_nombrescliente(v_contador) := fila.nombre_cliente;
    v_contador := v_contador+1;
    END LOOP;
    
    FOR i IN 1..v_nombrescliente.COUNT
    LOOP
        dbms_output.put_line(v_nombrescliente(i));
    END LOOP;
END;
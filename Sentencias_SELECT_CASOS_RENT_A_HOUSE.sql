-- CASO 1
SELECT 'El empleado ' || nombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp || ' nació el ' ||
fecnac_emp "LISTADO DE CUMPLEAÑOS"
FROM empleado	
ORDER BY fecnac_emp, appaterno_emp;

-- CASO 2
SELECT numrut_cli "NUMERO RUT", dvrut_cli "DIGITO VERIFICADOR",
       appaterno_cli || ' ' || apmaterno_cli || ' ' || nombre_cli "NOMBRE CLIENTE",
       renta_cli RENTA,
       fonofijo_cli "TELEFONO FIJO",
       celular_cli celular
FROM cliente      
ORDER BY appaterno_cli, apmaterno_cli;

-- CASO 3
SELECT nombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp "NOMBRE EMPLEADO",
       sueldo_emp sueldo, sueldo_emp*.50 "BONO POR CAPACITACION"
FROM empleado
ORDER BY "BONO POR CAPACITACION" DESC;



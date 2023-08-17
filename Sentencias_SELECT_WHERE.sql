/* La sentencia retorna el apellido y salario de los empledos que poseen un salario menor o igual a 2500 */
SELECT last_name, salary
FROM employees
WHERE salary <= 2500;

/* La sentencia retorna el apellido y salario de los empledos que poseen un salario  entre los 2100 y 4800 dólares, ambos
valores inclusivos. La información se muestra ordenada en forma ascendente por el salario de los empleados */
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2100 AND 4800
ORDER BY salary;


/* La sentencia retorna el apellido,salario y fecha de contrato de los empledos que fueron contratados entre el 01/01/2000 y
el 01/01/2018 ambas fechas inclusivas */
SELECT last_name, salary,hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/2000' AND '01/01/2018'
ORDER BY salary;


/* La sentencia retorna la identificación de empleado, su apellido e identificación del departamento en el que trabaja siempre que 
el empleado tenga apellido Hartstein o Vargas */
SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name IN('Hartstein','Vargas');


/* La sentencia retorna la identificación de empleado, su apellido e identificación del departamento en el que trabaja siempre que 
el empleado trabaje en el departamento 50 o en el departmaneto 100 0 en el departamento 201 */
SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN(50,100,201);

/*LIKE: trabaja con 2 símbolos: 
_ (guión bajo): que representa un caracter
%: que representa N caracteres */
/* La sentencia retorna la identificación y el primer nombre de los empleados cuyo primer nombre comience con una S (mayúscula) y 
continúe con 1 o varios caracteres (incluso puede ser que no contenga caracteres posteriores a la letra S) */
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE 'S%';


/* La sentencia retorna la identificación y el primer nombre de los empleados cuya última letra sea una s (minúscula) y antes puede
contener 1 o varios caracteres (cualquiera) */
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE '%s';


/* Las siguientes 3 sentencias retornan la identificación, primer nombre y fecha de contrato de los empleados que fueron contratados el año 2008.
Las 2 primeras sentencias requieren que en el formato de fecha definida en la base de datos el año esté en 4 dígitos  */
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '%/2008';

SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '%2008';

SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '%08';


/* Las siguientes 2 sentencias retornan la identificación, primer nombre y fecha de contrato de los empleados que fueron contratados en marzo
el año 2008 */
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '%/03/2008';

SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '__/03/2008';


/* La sentencia retorna los apellidos cuya segunda letra sea una o minúscula. El primer caracter puede contener cualquier valor y después de la letra
o puede contener el o los caracteres que sean */
SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';


/* La sentencia retorna los apellidos que contengan una letra o minúscula en cualquier parte */
SELECT last_name
FROM employees
WHERE last_name LIKE '%o%';


/* En SQL, la única forma de preguntar si el valor de una columna es nulo es usando el operador de comparación IS NULL. Para preguntar si el valor
de una columna no es nulo se debe usar el operador de comparacion IS NOT NULL (si la columna es numérica se puede usar también > 0).
Por lo tanto, la sentencia retorna a los empleados que NO poseen porcentaje de comisión */
SELECT *
FROM employees
WHERE commission_pct IS NULL;


/* La sentencia retorna a los empleados que poseen porcentaje de comisión */
SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;


/* Para que una sentencia SQL tenga más de una condición se debe usar el operador lógico OR y/o AND. Al usar sólo AND todas las condiciones deben 
ser verdaderas (se deben cumplir) para que la fila se visualice. Son el operador OR basta que una de las condiciones sea verdadera (se cumpla)
para que la fila se visualice). Para cambiar el orden de una condición se debe usar paréntesis.
/* La sentencia retorna la identificación, apellidos, identificación del trabajo y salario de los empleados que posean
un salario mayor o igual a 10000 Y ADEMAS su trabajo sea SA_MAN */
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >=10000
  AND job_id='SA_MAN';


/* La sentencia retorna la identificación, apellidos, identificación del trabajo y salario de los empleados que posean
un salario mayor o igual a 17000 o que hayan sido contratados con fecha posterior al 01/01/2008 */
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >=17000 
   OR hire_date > '01/01/2008';


/* Las siguientes 3 sentencias retornan la identificación, primer nombre y fecha de contrato de los empleados que fueron contratados en marzo
el año 2008 
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '%/03/2008';

-- Con operador lógico AND
SELECT last_name, hire_date
FROM employees
WHERE hire_date >= '01/03/2008'
AND hire_date <= '31/03/2008';

SELECT last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01/03/2008'
AND '31/03/2008';


/* Las siguientes 2 sentencias retornan el apellido y salario de los empledos que poseen un salario  entre los 2100 y 4800 dólares, ambos
valores inclusivos. La información se muestra ordenada en forma ascendente por el salario de los empleados */
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2100 AND 4800
ORDER BY salary

-- Opción con operador lógico AND
SELECT employee_id, last_name, salary
FROM employees
WHERE salary>= 2100 AND salary<=4800
ORDER BY salary ASC;


/* La siguiente sentencia retorna el apellido, identificación del trabajo y salario de los empleados que cumplan con alguna de las dos
condiciones: 
  - Condición 1: que posea el trabajo SA_REP.
  - Condición 2: que posea el trabajo AD_PRES y un salario mayor a
  15000 */ 
SELECT last_name, job_id, salary
FROM employees
WHERE job_id='SA_REP'
  OR job_id='AD_PRES'
  AND salary > 15000;
  
  
/* La siguiente sentencia retorna el apellido, identificación del trabajo y salario de los empleados que posean el trabajo SA_REP o el trabajo 
AD_PRES. Además, con cualquiera de los dos trabajos debe tener un salario mayor a 15000 */
SELECT last_name, job_id, salary
FROM employees
WHERE (job_id='SA_REP'
  OR job_id='AD_PRES')
  AND salary > 15000;


/* La claúsula DISTINCT permite obtener los diferentes valores de una columna. Esto signfica que los valores duplicados se muestran una sola vez.
La sentencia del ejemplo, muestra los DIFERENTES salarios que se les pagan a los empleados de la empresa. La información se muestra
ordenada desde el salario mayor al salario menor  */
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC;

/* La sentencia crea la tabla EMPLEADO_COPIA a partir del resultado que retorna la sentencia SELECT.
1.- Las columnas de la tabla EMPLEADO_COPIA serán las mismas columnas de la tabla EMPLOYEES y además tendrán los mismos tipos de datos y largos que las
columnas de EMPLOYEES.
2.- las columnas contienen las mismas constraint de tipo NULL de las columnas de la tabla EMPLOYEES
3.- Las constraints que no HEREDA desde la tabla EMPLOYEES son PK, FK, CHECK, DEFAULT
4.- Además, la tabla EMPLEADO_COPIA tendrá todos los datos que retorna la sentencia SELECT (osea todas las filas) */
CREATE TABLE empleado_copia
AS SELECT * FROM employees;


/* La sentencia crea la tabla DEPTO80
1.- Las columnas de la tabla DEPTO80 serán las columnas que retorna la setencia SELECT. Para la expresión salary*12 se el debe asignar un
alias porque un nombre de columna de tabla no puede contener el símbolo *. Por lo tanto, los nombres de columnas de la tabla DEPTO80 serán employee_id,
salario_anual y hire_date.
2.- La tabla DEPTO80 tendrá información de los empleados que trabajen en el departamento 80 */
CREATE TABLE depto80
AS SELECT employee_id, salary*12 salario_anual , hire_date
    FROM employees
    WHERE department_id=80;


/* La sentencia crea la tabla DEPTO30. En este caso las columnas de la tabla se definen en forma explícita y además se le crea la PK. Esta tabla tendrá
la identificación del empleado, su salario anual y la fecha de contrato de quienes trabajan en el departamento 30 */
CREATE TABLE depto30
(cod_empleado NOT NULL CONSTRAINTS PK_DPTO30 PRIMARY KEY,
 salario_anual NOT NULL,
 fecha_contrato NOT NULL)
AS SELECT employee_id, salary*12, hire_date
   FROM employees
   WHERE department_id=30;


/* En la sentencia se usa la variable de sustitución v_nro_emp lo que permite que cada vez que se ejecute la sentecia se asigne por pantalla el valor a 
esa variable y esto va a permitir que se muestre la información del empleado cuya identificación sea igual a la que se le asignó a la variable de 
sustitución */
SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id=&v_nro_emp;   


/* En la sentencia se usa la variable de sustitución v_id_trabajo lo que permite que cada vez que se ejecute la sentecia se asigne por pantalla el valor a 
esa variable y esto va a permitir que se muestre la información del empleado cuyo trabajo sea igual a la que se le asignó a la variable de 
sustitución. En este caso como se está comparando con un valor de tipo caracter debe ir entre comillas dobles la variable de sustitución. 
Si la variable de sustitución no se encierra entre comillas simples, entonces al asignar el valor a la variable se tendrá que incluir las comillas simples.
Pasa lo mismo si se comparan con valores de fechas */
SELECT employee_id, last_name, salary
FROM employees
WHERE job_id='&v_id_trabajo'; 



/* En la sentencia se usan las variables de sustitución v_nro_emp y v_valor_salario lo que permite que cada vez que se ejecute la sentecia se asigne por pantalla 
los valores a esas dos variables y esto va a permitir que se muestre la información del  empleado cuya identificación sea igual a la que se le asignó 
a la variable v_nro_emp o los empleados que posean un salario mayor al que se le asignó a la variable v_valor_salario */
SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id=&v_nro_emp
  OR salary > &v_valor_salario;


/* En la sentencia se usan 3 variables de sustitución: v_nombre_columna, v_condicion y v_columna_orden. Esto permite que en la clásula SELECT se 
obtenga calquier columna (que exista en la tabla EMPLOYEES) de acuerdo al nombre que se ingrese en la variable nombre_columna. 
Para la condición de la sentencia también se usa una variable de sustitución (condicion) lo que permite que la condición pueda ser modificada en tiempo
de ejecución. 
El ordenamiento de la información también será ingresada en forma tiempo de ejecución de la sentencia a través de la variabla columna_orden. Esto
permite que la condición pueda ser diferente en cada ejecución*/
SELECT employee_id, last_name, &v_nombre_columna
FROM employees
WHERE &v_condicion
ORDER BY &v_columna_orden;


/* En la sentencia, la variable v_nombre_columna primero se define con &&. Esto permite que si la misma variable se vuelve a usar en otra cláusula de 
la sentencia la base de datos hará el reemplazo en forma automática con el valor que se le asigne la primera vez. 
Toda variable que se define con && queda definida en forma permanente en la memoria de la BD. Por esta razón, se debe eliminar usando el comando UNDEFINE */
SELECT employee_id, last_name, &&v_nombre_columna
FROM employees
ORDER BY &v_nombre_columna;

/* Cuando se definen variables de sustitución con && se deben eliminar desde la memoria de la BD con la sentencia UNDEFINE. 
Por lo tanto, se elimina la variable nombre_columna desde la memoria de la BD */
UNDEFINE nombre_columna




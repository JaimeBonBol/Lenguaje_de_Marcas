(:a Consigue el nombre de los módulos que se imparten en el instituto (elemento):)
"APARTADO A)",
doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo/nombre,

(:b Muestra el nombre de los módulos del ciclo ASIR (contenido):)
"APARTADO B)",
for $x in doc("ejercicio_1_modulos_informatica.xml")//modulo[ciclo="ASIR"]
return $x /nombre/text(),

(:c Devuelve el nombre de los módulos que se imparten en el segundo curso de
cualquier ciclo (elemento):)
"APARTADO C)",
for $x in doc("ejercicio_1_modulos_informatica.xml")//modulo[curso = "2"]
return $x /nombre,

(:d Devuelve el nombre de los módulos que se imparten en el primer curso de ASIR
(elemento) y ordénalos alfabéticamente:)
"APARTADO D)",
for $x in doc("ejercicio_1_modulos_informatica.xml")//modulo[ciclo="ASIR" and curso="1"]
order by $x /nombre
return $x /nombre,

(:e Obtén el nombre de los módulos con menos de 5 horas semanales (contenido):)
"APARTADO E)",
for $x in doc("ejercicio_1_modulos_informatica.xml")//modulo
where $x /horasSemanales < 5
return $x /nombre/text(),

(:f Devuelve el número de módulos que se imparten en el primer curso de ASIR
(número):)
"APARTADO F)",
count(doc("ejercicio_1_modulos_informatica.xml")//modulo[ciclo="ASIR" and curso="1"]),

(:g Muestra las horas semanales de los módulos con más de 3 horas semanales
(contenido):)
"APARTADO G",
for $x in doc("ejercicio_1_modulos_informatica.xml")//modulo
where $x /horasSemanales > 3
return $x /horasSemanales/text()

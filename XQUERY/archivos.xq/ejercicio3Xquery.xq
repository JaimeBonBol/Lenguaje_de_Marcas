(:a Muestra los títulos de todos los libros (contenido):)
"APARTADO A)",
doc ("ejercicio_3_libros.xml")//titulo/text(),

(:b Devuelve todos los títulos de los libros del año 2000. (elemento):)
"APARTADO B)",
for $x in doc ("ejercicio_3_libros.xml")//libro[@year="2000"]
return $x /titulo,

(:c Devuelve todos los títulos de los libros entre el año 1995 y 2000. Ambos incluidos.
(elemento):)
"APARTADO C)",
for $x in doc ("ejercicio_3_libros.xml")//libro[@year >= "1995" and @year <= "2000"]
return $x /titulo,

(:d Obtén todos los títulos de los libros que tengan algún autor de apellido ‘Stevens’
(contenido):)
"APARTADO D)",
for $x in doc ("ejercicio_3_libros.xml")//libro
where $x //apellido = "Stevens"
return $x/titulo/text(),

(:e Muestra los títulos de todos los libros almacenados de la editorial "Addison-
Wesley", primero con una cláusula "for" y, a continuación, con una cláusula "let"
(elemento):)
"APARTADO E CON FOR)",
for $x in doc ("ejercicio_3_libros.xml")//libro
where $x /editorial = "Addison-Wesley"
return $x /titulo,

"APARTADO E CON LET)",
let $x := doc ("ejercicio_3_libros.xml")//libro[editorial = "Addison-Wesley"]
return $x /titulo,

(:f Consigue todos los títulos de los libros que tengan un solo autor ordenados por
precio (elemento):)
"APARTADO F)",
for $x in doc("ejercicio_3_libros.xml")//libro[count(autor) = 1]
order by $x/precio
return $x /titulo,

(:g Devuelve todos los títulos de los libros que tengan más de dos autores ordenados
por su título (elemento):)
"APARTADO G)",
for $x in doc("ejercicio_3_libros.xml")//libro[count(autor) > 2]
order by $x /titulo
return $x /titulo,

(:h Devuelve el título y el año de cada uno de los libros junto con el número de
autores de cada libro (elemento). ¿Puedes hacerlo directamente?:)
"APARTADO H)",
for $x in doc("ejercicio_3_libros.xml")//libro
return $x /titulo,
for $x in doc("ejercicio_3_libros.xml")//libro
return $x /@year,
for $x in doc("ejercicio_3_libros.xml")//libro
return count($x/autor),

(:i Repite el apartado generando el siguiente fichero XML:)
"APARTADO I)",

<resumen_bib>&#10;
{
  for $x in doc("ejercicio_3_libros.xml")//libro
return
<libro>&#10;
  <titulo>{$x /titulo/text()}</titulo>&#10;
  <year>{$x /@year}</year>&#10;
  <autores>{let $c:= count($x /autor)
  return $c
  }</autores>&#10;
</libro>
}&#10;
</resumen_bib>,

(:j Devuelve los títulos de todos los libros y los apellidos de sus dos primeros autores.
En el caso de que existan más de dos autores para un libro, se añade un tercer
autor "et al.". Para ello genera el siguiente XML:)
"APARTADO J)",
"PREGUNTAR A MIGUEL COMO SEPARAR LOS APELLIDOS",
<resumen_bib>&#10;
{
  for $x in doc("ejercicio_3_libros.xml")//libro
  return
  <libro>&#10;
  <titulo>{$x /titulo/text()}</titulo>&#10;
  <autores>&#10;
     <apellido>{$x //apellido/text()}</apellido>&#10;
  </autores>&#10;
  </libro>
}&#10;
</resumen_bib>,

(:k Devuelve los títulos de todos los libros, su editorial y los comentarios del mismo, si
es que tiene algún comentario. Si no tiene, usarás la etiqueta <sin_comentario/>.
Para ello genera el siguiente XML:)
"APARTADO K)",
"PREGUNTAR A MIGUEL COMO PONER SOLO EL COMENTARIO DEL LIBRO QUE QUIERO",
<resumen_bib_com>&#10;
{
  for $x in doc("ejercicio_3_libros.xml")//libro
  return
  <libro>&#10;
  <titulo>{$x /titulo/text()}</titulo>&#10;
  <editorial>{$x /editorial/text()}</editorial>&#10;
  <comentario>&#10;
  {
    let $c := doc("ejercicio_3_libros_comentarios.xml")//entrada[titulo = $x/titulo]
    return
      if (count($c) > 0) then
      for $comentario in $c
      return 
      <comentario>{$comentario /comentario/text()}</comentario>
      else 
      <sin_comentario></sin_comentario>
  }&#10;
  </comentario>
  </libro>
}&#10;
</resumen_bib_com>,

(:l Consigue los títulos de todos los libros en los que al menos uno de sus autores es
'Stevens' (elemento). Usa "some". Este cuantificador existencial permite definir
consultas que devuelvan algún elemento que satisfaga la condición:)
"APARTADO L)",
"PREGUNTAR A MIGUEL POR QUE HAY QUE CREAR OTRA VARIABLE PARA EL SOME",
for $x in doc("ejercicio_3_libros.xml")//libro
where some $autor in $x /autor satisfies $autor/apellido = "Stevens"
return $x /titulo,

(:m Devuelve todos los títulos de los libros en los que todos los autores sean 'Stevens'
(elemento). Usa "every". Este cuantificador existencial permite devolver los
elementos en los que todos sus nodos satisfagan la condición.:)
"APARTADO M)",
for $libro in doc("ejercicio_3_libros.xml")//libro
where every $p in $libro /autor satisfies contains ($p /autor/apellido, "Stevens")
return $libro /titulo,

(:n Devuelve todos los apellidos distintos de los autores (elemento). Usa "distinct-
values()". Esta función extrae los valores de una secuencia de nodos y crea una
nueva secuencia con valores únicos eliminando los nodos duplicados:)
"APARTADO N)",

distinct-values(for $autor in doc("ejercicio_3_libros.xml")//autor
return $autor/apellido),

(:o Usa "empty()" y "exists()" en dos consultas distintas inventadas por ti. La función
"empty()" devuelve cierto cuando la expresión entre paréntesis está vacía. La
función opuesta a "empty()" es "exists()", la cual devuelve cierto cuando una
secuencia contiene, al menos, un elemento:)
"APARTADO O)",
"EMPTY: En este caso me he inventado la consulta para ver si la etiqueta autor esta vacía en los libros, donde solo esta vacía en el último ya que tiene editor y no autor.",
for $libro in doc("ejercicio_3_libros.xml")//libro
return empty($libro/autor),

"EXISTS: En este caso me he inventado la consulta para ver si existe el atributo year y está rellenado.",
for $libro in doc("ejercicio_3_libros.xml")//libro
return exists($libro/@year)
(:a Muestra el nombre de todos los bailes (contenido):)
"APARTADO A)",
for $x in doc ("ejercicio_2_bailes.xml")//baile
return $x/nombre/text(),

(:b Consigue el nombre de todos los bailes que se realizan en la sala número uno
(elemento):)
"APARTADO B)",
for $x in doc ("ejercicio_2_bailes.xml")//baile[sala="1"]
return $x /nombre,

(:c Muestra todos los bailes con toda su información que se imparten en la sala
número dos y cuyo precio sea menor que 35,00 EUROS (elemento):)
"APARTADO C)",
for $x in doc ("ejercicio_2_bailes.xml")//baile
where $x/sala = 2 and $x /precio < 35
return $x ,

(:d Obtén el nombre de todos los profesores que dan clase con cuotas mensuales
(contenido):)
"APARTADO D)",
for $x in doc ("ejercicio_2_bailes.xml")//baile
where $x /precio/@cuota = "mensual"
return $x /profesor/text(),

(:e Genera un nuevo documento XML que almacena la información de los bailes que
imparte el profesor "Jesús Lozano" con la siguiente estructura:)
"APARTADO E)",
<bailes_lozano profesor = "Jesus Lozano">

{
  for $x in doc ("ejercicio_2_bailes.xml")//baile
  where $x/profesor = "Jesús Lozano"
  return <baile>&#10;
    <nombre>{$x/nombre/text()}</nombre>&#10;
    <plazas>{$x/plazas/text()}</plazas>&#10;
    <duracion>DE { $x /comienzo/text()} A {$x /fin/text()}</duracion>&#10;
  </baile>

}

</bailes_lozano>,

(:f Genera un documento HTML con una tabla HTML que muestre el nombre del
baile, el profesor que lo imparte y el número de plazas ofertadas, pero
estableciendo la condición de ser bailes con cuota trimestral. Además, se
ordenarán de menor a mayor los bailes según el número de plazas disponibles:)
"APARTADO F)",
<html>&#10;
<body>&#10;
<h2>Tabla</h2>&#10;
<table>&#10;
{
  for $baile in doc("ejercicio_2_bailes.xml")//baile
  where $baile /precio/@cuota = "trimestral"
  order by $baile /plazas
  return
  <tr>&#10;
  <td>{$baile /nombre/text()}</td>&#10;
  <td>{$baile /profesor/text()}</td>&#10;
  <td>{$baile /plazas/text()}</td>&#10;
  </tr>
}&#10;
</table>&#10;
</body>&#10;
</html>
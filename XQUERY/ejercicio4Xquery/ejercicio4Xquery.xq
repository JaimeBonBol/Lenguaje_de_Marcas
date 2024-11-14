(:a Obtener el número de alumnos de la clase (número):)
"APARTADO A)",
 count (doc("ejercicio_4_clase.xml")//alumno),

(:b Obtener el número de módulos que se imparten (número):)
"APARTADO B)",
count (doc("ejercicio_4_clase.xml")//asignaturas/asignatura),

(:c Obtener el nombre y apellidos de todos los alumnos matriculados en algún
módulo, es decir que tenga alguna nota (elemento). Usa el operador unión:)
"APARTADO C)",
for $alumno in doc("ejercicio_4_clase.xml")//alumno
where doc("ejercicio_4_clase.xml")//nota/@alum = $alumno/@cod
return $alumno /apenom,

(:d Obtener las calificaciones del alumno de código "n43483437" en cada uno de sus
módulos. Para ello genera el siguiente XML:)
"APARTADO D)",
<alumno_cod>&#10;
{
 for $alumno in  doc("ejercicio_4_clase.xml")//alumno[@cod="n43483437"]
 return 
<alumno_cod>{data($alumno/@cod)}</alumno_cod>

}
<modulo>&#10;
{
  for $nota in doc("ejercicio_4_clase.xml")//nota[@alum="n43483437"]
  let $asig:=doc("ejercicio_4_clase.xml")//asignatura[@cod = $nota/@asig]  
  return
  <modulo>&#10;
  <nombre_modulo>{data($asig/@nombre)}</nombre_modulo>&#10;
  <nota>{data($nota /@calificacion)}</nota>  &#10;
  </modulo>
}&#10;

</modulo>&#10;
 
</alumno_cod>,

(:e Obtener los nombres de los alumnos matriculados en LMSGI y sus notas. El
resultado estará ordenado por notas de forma descendente. Para ello genera el
siguiente XML:)
"APARTADO E)",
<lmsgi>&#10;
{
  for $alumno in doc("ejercicio_4_clase.xml")//nota[@asig = "a4"]
  where doc("ejercicio_4_clase.xml")//asignatura[@cod = $alumno/@asig]
  order by ($alumno /@calificacion) descending
  return 
  <alumno>&#10;
  <codigo_alumno>{data($alumno/@alum)}</codigo_alumno>&#10;
  <nota>{data($alumno/@calificacion)}</nota>&#10;
  </alumno>
}&#10;
</lmsgi>,

(:f Repite el ejercicio anterior, pero muestra solo los alumnos que hayan aprobado.:)
"APARTADO F)",

<lmsgi>&#10;
{
  for $alumno in doc("ejercicio_4_clase.xml")//nota[@asig = "a4" and @calificacion > 5]
  where doc("ejercicio_4_clase.xml")//asignatura[@cod = $alumno/@asig]
  order by ($alumno /@calificacion) descending
  return 
  <alumno>&#10;
  <codigo_alumno>{data($alumno/@alum)}</codigo_alumno>&#10;
  <nota>{data($alumno/@calificacion)}</nota>&#10;
  </alumno>
}&#10;
</lmsgi>
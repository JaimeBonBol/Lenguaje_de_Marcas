async function cargarXML() {
    try{
        const response = await fetch("sources/productos.xml");
        if(!response.ok) throw new Error("Error al cargar el archivo XML");
        
        const xmlText = await response.text();

        // Se parsea el xml, y se guarda en formato String en la variable xmlDoc.
        const parser = new DOMParser();
        const xmlDoc = parser.parseFromString(xmlText, "application/xml");

        // Se guarda en la variable productosXml lo que hay dentro de la etiqueta Producto del xml. Busca todas las etiquetas Producto dentro del xml.
        const productosXml = xmlDoc.getElementsByTagName("Producto");

        // Lista donde almacenar los datos de cada producto.
        const productos = [];
        const etiquetasXml = xmlDoc.getElementsByTagName("Etiquetas");

        // Bucle para recorrer todos los productos.
        for (let i = 0; i < productosXml.length; i++) {
            
            const nombre = xmlDoc.getElementsByTagName("Nombre")[i].textContent;

            const precio = xmlDoc.getElementsByTagName("Precio")[i].textContent;
            const etiquetaIt = etiquetasXml[i].getElementsByTagName("Etiqueta");
            
            // Variable para tener guardado el div donde mostrar la información.
            const contenedor = document.getElementById("contenido-xml");

            // Crear div para añadirle el nombre, precio y las etiquetas.
            const divDOM = document.createElement('div');
            divDOM.classList.add('div-DOM');

            const tituloDOM = document.createElement('h2');
            tituloDOM.classList.add('titulo-DOM');

            const precioDOM = document.createElement('p');
            precioDOM.classList.add('precio-DOM')

            const etiquetasDOM = document.createElement('p');
            etiquetasDOM.classList.add('etiquetas-DOM')
            tituloDOM.innerHTML = `
                ${nombre}
            `;

            precioDOM.innerHTML = `
                Precio:
                ${precio}
            `;
            etiquetasDOM.innerHTML = `Etiquetas: <br>`;
            for (let index = 0; index < etiquetaIt.length; index++) {
                etiquetasDOM.innerHTML += `
                    <br>
                    ${etiquetaIt[index].textContent}
                `
            }
            

            divDOM.append(tituloDOM, precioDOM, etiquetasDOM);

            //Insertar en el html.
            contenedor.appendChild(divDOM);
            
            document.getElementById("btn").disabled = true;
        }

    }catch(error){
        console.log(error);
    }
}

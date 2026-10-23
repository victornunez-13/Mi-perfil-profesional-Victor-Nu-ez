# Mi-perfil-profesional-Victor-Nuñez

Sitio web de perfil profesional de **Victor Núñez**,
servido mediante **Nginx** dentro de un contenedor **Docker**.

---

## 🎯 Objetivo del proyecto

El objetivo de este proyecto es presentar un sitio web personal tipo portafolio
que muestre el perfil profesional, la formación académica, los intereses y las
áreas de especialización de Victor Núñez, estudiante de Ingeniería en Sistemas
(ESPE). El sitio se construyó adaptando el contenido y la estructura de un
mockup de plantilla profesional, e incluye secciones de presentación personal,
intereses con ventanas modales informativas, formación académica, enlaces de
interés y un formulario de contacto funcional.

Como segundo objetivo, todo el sitio se empaqueta como una **imagen Docker**
basada en **Nginx**, lo que permite desplegarlo de forma rápida, portable y
reproducible en cualquier servidor o plataforma que soporte contenedores,
sin depender de configuraciones manuales del servidor web.

---

## 🛠️ Tecnologías utilizadas

| Tecnología | Versión / Detalle | Uso en el proyecto |
|---|---|---|
| **HTML5** | Semántico | Estructura del sitio: header, hero, secciones, formulario de contacto y footer |
| **CSS3** | Variables CSS (design system) | Estilos, diseño responsive, animaciones, adaptación del mockup |
| **JavaScript** | Vanilla (sin frameworks) | Sliders del hero, menús desplegables, modales "Saber Más", toast del formulario, scroll suave |
| **Nginx** | 1.27 (Alpine) | Servidor web que entrega los archivos estáticos |
| **Docker** | Engine 20.10+ | Empaquetado y distribución del sitio como imagen de contenedor |
| **Docker Compose** | v2 | Orquestación: construir y levantar el sitio con un solo comando |

---

## 📁 Estructura del proyecto

```
victor-nunez-web/
├── index.html            # Página principal (perfil, intereses, formación,
│                         #   enlaces y formulario de contacto) - adaptada al mockup
├── imagenes/
│   └── perfil.jpeg       # Fotografía de perfil (referenciada por index.html)
├── Dockerfile            # Receta para construir la imagen Docker (Nginx)
└── README.md             # Este archivo
```

> **Nota:** `index.html` contiene el CSS y el JavaScript embebidos (integrados
> al propio archivo), tal como venían en la plantilla del mockup adaptada.

---

## 🐳 Instrucciones para construir y ejecutar la imagen Docker

### Prerrequisitos

- Tener instalado **Docker Engine** (20.10 o superior).
  Descarga: <https://docs.docker.com/get-docker/>
- (Opcional) **Docker Compose v2** — incluido en Docker Desktop y en las
  versiones recientes de Docker Engine para Linux.
- La carpeta del proyecto debe estar completa (ver estructura anterior),
  incluyendo `imagenes/perfil.jpeg`.

### Opción A — Con Docker Compose (recomendado)

```bash
# 1. Sitúate en la raíz del proyecto (donde está el Dockerfile)
cd Nuñez Victor

# 2. Construye la imagen y levanta el contenedor en segundo plano
docker compose up -d --build

# 3. Abre el sitio en tu navegador
#    http://localhost:8080
```

Comandos de gestión:

```bash
docker compose ps        # ver estado del contenedor
docker compose logs -f   # ver logs de Nginx en vivo
docker compose down      # detener y eliminar el contenedor
```

### Opción B — Con comandos Docker directos

```bash
# 1. Construir la imagen a partir del Dockerfile
docker build -t victor-nunez-web:latest .

# 2. Ejecutar el contenedor mapeando el puerto 8080 al 80 interno
docker run -d -p 8080:80 --name victor-nunez-web victor-nunez-web:latest

# 3. Abrir en el navegador
#    http://localhost:8080

# 4. Detener y limpiar cuando ya no lo necesites
docker stop victor-nunez-web && docker rm victor-nunez-web
```

### Cambiar el puerto

Si el puerto `8080` está ocupado en tu máquina, cámbialo por otro libre
(por ejemplo `9090`):

- **Con Compose:** edita `docker-compose.yml` → `"9090:80"` y vuelve a
  ejecutar `docker compose up -d`.
- **Con docker run:** usa `-p 9090:80`.

El `80` de la derecha **no se modifica**: es el puerto interno donde Nginx
escucha dentro del contenedor.

### Actualizar el sitio tras hacer cambios

```bash
docker compose up -d --build   # reconstruye la imagen con los archivos nuevos
```

---

## 🔗 Enlace a Docker Hub

La imagen del proyecto está publicada en Docker Hub:

### 👉 <https://hub.docker.com/r/victor124312/mi-perfil-profesional-victor-nunez>


**Cómo publicar / actualizar la imagen en Docker Hub:**

```bash
# 1. Inicia sesión en Docker Hub desde la terminal
docker login

# 2. Etiqueta la imagen local con tu usuario de Docker Hub
docker tag victor-nunez-web:latest victornunez-13/victor-nunez-web:latest

# 3. Sube la imagen al registro
docker push victornunez-13/victor-nunez-web:latest
```

**Cómo descargar y ejecutar la imagen desde Docker Hub** (en cualquier
servidor con Docker):

```bash
docker pull victor124312/mi-perfil-profesional-victor-nunez:v1
docker run -d -p 8080:80 --name victor-nunez-web victor124312/mi-perfil-profesional-victor-nunez:v1
```

---

## 🐙 Repositorio en GitHub

El código fuente del proyecto está alojado en GitHub, bajo el usuario
**victornunez-13**:

### 👉 <https://github.com/victornunez-13/Mi-perfil-profesional-Victor-Nu-ez.git>


**Clonar el repositorio y desplegarlo con Docker:**

```bash
git clone https://github.com/victornunez-13/victor-nunez-web.git
cd victor-nunez-web
docker compose up -d --build

# El sitio queda disponible en http://localhost:8080
```



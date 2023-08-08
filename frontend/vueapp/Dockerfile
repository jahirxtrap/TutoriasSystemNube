# Usa una imagen de Node.js como base
FROM node:14

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo package.json y package-lock.json para instalar las dependencias
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de los archivos del proyecto al directorio de trabajo del contenedor
COPY . .

# Compila el proyecto Vue.js para producción
RUN npm run build

# Expone el puerto en el que el servidor Vue.js estará escuchando (puerto 8080 por defecto)
EXPOSE 8080

# Comando para iniciar el servidor Vue.js (el mismo que usas en el script "serve" del package.json)
CMD ["npm", "run", "serve"]
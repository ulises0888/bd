# Usa una imagen oficial de Node.js con Alpine
FROM node:14

# Establece el directorio de trabajo
WORKDIR /app

# Copia solo los archivos de dependencias primero
COPY package*.json ./

# Instala las dependencias de forma más controlada
RUN npm install 
# Copia el resto de los archivos del backend
COPY . .

# Expone el puerto donde corre el backend
EXPOSE 5000

# Comando para iniciar el servidor
CMD ["node", "index.js"]

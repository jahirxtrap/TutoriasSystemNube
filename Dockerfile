# Utiliza una imagen de Python oficial
FROM python:3.9

# Establece el directorio de trabajo en /code
WORKDIR /code

# Establece la variable de entorno de Python para que no se generen archivos .pyc
ENV PYTHONDONTWRITEBYTECODE 1

# Deshabilita el almacenamiento en caché de Python
ENV PYTHONUNBUFFERED 1

# Instala las dependencias del proyecto
COPY ./requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copia los archivos del proyecto al contenedor
COPY . /code/

# Configura las variables de entorno para Django
ENV DJANGO_SETTINGS_MODULE=configTutorias.settings

# Ejecuta las migraciones de Django y recoge los archivos estáticos
# RUN python manage.py migrate

# Las migraciones iniciales se hacen de forma manual dentro de docker
# python manage.py makemigrations, python manage.py migrate

# Exponer el puerto 8000 para que pueda ser accedido desde fuera del contenedor
EXPOSE 8000

# Inicia el servidor de desarrollo de Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

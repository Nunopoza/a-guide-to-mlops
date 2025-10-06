# Imagen base con Python 3.10 (compatible con TensorFlow)
FROM python:3.10-slim

ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar archivos del proyecto al contenedor
COPY . /app

# Instalar dependencias Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Crear el archivo freeze de dependencias
RUN pip freeze --local --all > requirements-freeze.txt

# Ejecutar bash por defecto
CMD ["bash"]


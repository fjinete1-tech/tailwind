FROM python:3.12-slim

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Instalar dependencias del sistema + Microsoft ODBC Driver 18
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    ca-certificates \
    unixodbc \
    unixodbc-dev \
    gcc \
    g++ \
    && curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
       | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/microsoft-prod.gpg] https://packages.microsoft.com/debian/12/prod bookworm main" \
       > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql17 \
    && rm -rf /var/lib/apt/lists/*


# Copiar proyecto
COPY requirements.txt .

# Instalar librerías Python
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt


COPY . .


# Puerto de Render
EXPOSE 8000


# Ejecutar Django con Gunicorn
CMD ["gunicorn", "tu_proyecto.wsgi:application", "--bind", "0.0.0.0:8000"]
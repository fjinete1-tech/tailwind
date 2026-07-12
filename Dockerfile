FROM python:3.12-slim

<<<<<<< HEAD
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    unixodbc \
    unixodbc-dev

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN curl https://packages.microsoft.com/config/debian/12/prod.list \
    > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql17
=======
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    ACCEPT_EULA=Y

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl gnupg2 unixodbc unixodbc-dev \
    && curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/microsoft-prod.gpg] https://packages.microsoft.com/debian/12/prod bookworm main" > /etc/apt/sources.list.d/microsoft-prod.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends msodbcsql17 \
    && rm -rf /var/lib/apt/lists/*
>>>>>>> staging

WORKDIR /app

COPY requirements.txt .
<<<<<<< HEAD

RUN pip install -r requirements.txt

COPY . .

=======
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 10000

>>>>>>> staging
CMD ["gunicorn", "core.wsgi:application", "--bind", "0.0.0.0:10000"]
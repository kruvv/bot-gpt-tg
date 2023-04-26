# Базовый образ с Node.js
FROM node:16-alpine

# Установка рабочего каталога
WORKDIR /app

# Копирование package.json и package-lock.json (если они есть) в рабочий катоалог
COPY package*.json  ./

# Установка зависимостей 
RUN npm ci 

# Копирование остальных файлов проекте в рабочий каталог
COPY . .

# Установка переменной окружения для определения номера порта, который будет использоваться
ENV PORT=3000

# Объявление порта, который будет использоваться вашим приложением
EXPOSE $PORT

# Запуск приложения
CMD [ "npm", "start" ]
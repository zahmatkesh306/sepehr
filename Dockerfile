FROM node:18-slim

# نصب ابزارهای مورد نیاز برای دانلود و اجرای Xray
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# پوشه کاری برنامه
WORKDIR /app

# کپی و نصب وابستگی‌های Node.js
COPY package*.json ./
RUN npm install --production

# کپی سورس‌کد
COPY . .

# ایجاد ساختار پوشه دیتابیس و داده‌ها
RUN mkdir -p /app/data

EXPOSE 3000

CMD ["npm", "start"]

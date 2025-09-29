FROM python:3.11-slim

# تثبيت المكتبات السيستم المطلوبة
RUN apt-get update && apt-get install -y \
    build-essential \
    libglib2.0-0 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# نسخ الملفات إلى الحاوية
COPY . /app

# تثبيت البايثون باكدجات
RUN pip install --no-cache-dir fastapi uvicorn rembg onnxruntime python-multipart

# فتح البورت
EXPOSE 10000

# تشغيل السيرفر
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]

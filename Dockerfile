FROM python:3.11-slim

# نثبت المكتبات الأساسية
RUN apt-get update && apt-get install -y \
    build-essential \
    libglib2.0-0 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# ننسخ ملفات المشروع
WORKDIR /app
COPY main.py /app/main.py

# نثبت المكتبات المطلوبة
RUN pip install --no-cache-dir fastapi uvicorn rembg onnxruntime python-multipart

EXPOSE 10000

# نشغّل السيرفر
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]

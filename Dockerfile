FROM python:3.11-slim

# نثبت المتطلبات
RUN apt-get update && apt-get install -y \
    build-essential \
    libglib2.0-0 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir fastapi uvicorn rembg onnxruntime

EXPOSE 10000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]

FROM python:3.11-slim

# نزّل dependencies أساسية (عشان onnxruntime يشتغل صح)
RUN apt-get update && apt-get install -y \
    build-essential \
    libglib2.0-0 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# نزّل rembg + onnxruntime
RUN pip install --no-cache-dir rembg onnxruntime

EXPOSE 10000

CMD ["rembg", "s", "--host", "0.0.0.0", "--port", "10000", "-m", "u2netp", "--log_level", "warning"]

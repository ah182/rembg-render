# استخدم Python 3.11 كـ base image
FROM python:3.11-slim

# تثبيت المكتبات الأساسية
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*


# Preload الموديل وقت الـ Build (عشان يكون جاهز)
RUN python -c "from rembg import new_session; new_session()"

# تشغيل السيرفر على Render
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]

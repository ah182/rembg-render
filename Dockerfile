# استخدم صورة Python خفيفة
FROM python:3.11-slim

# نزّل rembg من PyPI
RUN pip install --no-cache-dir rembg

# عرّض البورت اللي هنستخدمه
EXPOSE 10000

# شغّل rembg server مباشرة
CMD ["rembg", "s", "--host", "0.0.0.0", "--port", "10000", "-m", "u2netp", "--log_level", "warning"]

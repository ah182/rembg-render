# استخدم صورة rembg الجاهزة من Docker Hub
FROM danielgatis/rembg:latest

# عرّض البورت اللي هيستخدمه Render (هيبعت PORT في env)
EXPOSE 10000

# شغّل rembg server على كل الواجهات، استخدم موديل خفيف u2netp
CMD ["sh", "-c", "rembg s --host 0.0.0.0 --port ${PORT:-10000} -m u2netp --log_level warning"]

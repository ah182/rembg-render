FROM danielgatis/rembg:latest

EXPOSE 10000

# شغل rembg مباشرة من غير sh
CMD ["rembg", "s", "--host", "0.0.0.0", "--port", "10000", "-m", "u2netp", "--log_level", "warning"]

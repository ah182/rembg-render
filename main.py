from fastapi import FastAPI, UploadFile, File
from rembg import remove

app = FastAPI()

@app.get("/")
@app.head("/")  # <-- أضف دعم للـ HEAD هنا
def root():
    return {"message": "Server is running ✅"}

@app.post("/api/remove")
async def remove_bg(file: UploadFile = File(...)):
    input_bytes = await file.read()
    output_bytes = remove(input_bytes)
    return {"removed": len(output_bytes)}

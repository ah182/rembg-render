from fastapi import FastAPI, File, UploadFile
from fastapi.responses import Response
from rembg import remove

app = FastAPI()

@app.post("/api/remove")
async def remove_bg(file: UploadFile = File(...)):
    image_data = await file.read()
    result = remove(image_data)
    return Response(content=result, media_type="image/png")

@app.get("/")
async def root():
    return {"status": "ok"}

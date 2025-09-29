from fastapi import FastAPI, UploadFile, File
from rembg import remove
from fastapi.responses import JSONResponse, Response
import uvicorn

app = FastAPI()

@app.get("/")
def health_check():
    return {"message": "Server is running ✅"}

@app.post("/api/remove")
async def remove_bg(file: UploadFile = File(...)):
    image_data = await file.read()
    result = remove(image_data)
    return Response(content=result, media_type="image/png")

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=10000)

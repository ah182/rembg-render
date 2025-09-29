import os
import uvicorn
from fastapi import FastAPI, UploadFile, File, Response
from rembg import remove, new_session

app = FastAPI()

# ✅ Preload session أول ما السيرفر يشتغل (runtime)
session = None

@app.on_event("startup")
async def preload_model():
    global session
    session = new_session()
    print("✅ Model preloaded successfully.")

@app.get("/")
def health_check():
    return {"message": "Server is running ✅"}

@app.post("/api/remove")
async def remove_bg(file: UploadFile = File(...)):
    global session
    image_data = await file.read()
    result = remove(image_data, session=session)
    return Response(content=result, media_type="image/png")

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 10000))  # لو Render مش مرر بورت، استخدم 10000
    uvicorn.run(app, host="0.0.0.0", port=port)

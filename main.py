from fastapi import FastAPI, UploadFile, File, Response
from rembg import remove

app = FastAPI()

@app.get("/")
def root():
    return {"message": "Server is running ✅"}

@app.head("/")
def healthcheck():
    return Response(status_code=200)

@app.post("/api/remove")
async def remove_bg(file: UploadFile = File(...)):
    input_bytes = await file.read()
    output_bytes = remove(input_bytes)
    return {"removed": len(output_bytes)}

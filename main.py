from fastapi import FastAPI
from fastapi.responses import FileResponse # 1. Import FileResponse

app = FastAPI()

@app.get("/", response_class=FileResponse)
async def read_index():
    # 2. Return the file path in a FileResponse
    return "index.html"
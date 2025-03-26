from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from starlette.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class HelloWorld(BaseModel):
    message: str


@app.get("/", response_model=HelloWorld)
async def hello_world():
    return {"message": "Hello, World!"}


app.mount("/assets", StaticFiles(directory="static/assets"), name="static")


@app.get("/backoffice", response_class=HTMLResponse)
async def read_backoffice():
    with open("static/index.html") as f:
        return f.read()

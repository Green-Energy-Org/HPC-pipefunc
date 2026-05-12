"""Minimal HTTP entrypoint — health + version check for container probes."""
import uvicorn
from fastapi import FastAPI
import pipefunc

app = FastAPI(title="pipefunc")

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/version")
def version():
    return {"version": pipefunc.__version__}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)

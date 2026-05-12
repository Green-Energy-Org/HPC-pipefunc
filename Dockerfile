FROM python:3.13-slim
 
WORKDIR /app
 
# Install uv for fast installs
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv
 
# Copy project files
COPY pyproject.toml uv.lock* README.md ./
COPY pipefunc/ ./pipefunc/
 
# Install project + a minimal HTTP server
RUN uv pip install --system -e ".[all]" fastapi uvicorn
 
# Minimal entrypoint: serves a health + version endpoint
COPY docker/app.py ./app.py
 
EXPOSE 8000
 
CMD ["python", "app.py"]
 

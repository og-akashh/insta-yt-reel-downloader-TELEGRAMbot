FROM python:3.11-slim

WORKDIR /app

# Install ffmpeg and clean up
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Create downloads directory
RUN mkdir -p /app/downloads

ENV PYTHONUNBUFFERED=1

# Expose the port for health checks (Render uses PORT env)
EXPOSE $PORT

CMD ["python", "-m", "src.bot"]

FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -u 1000 botuser && chown -R botuser:botuser /app
USER botuser

COPY requirements.txt .
RUN pip install --no-cache-dir --no-warn-script-location -r requirements.txt

COPY --chown=botuser:botuser . .

RUN mkdir -p /app/downloads

ENV PYTHONUNBUFFERED=1

EXPOSE $PORT

CMD ["python", "-m", "src.bot"]

import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    BOT_TOKEN = os.getenv("BOT_TOKEN")
    if not BOT_TOKEN:
        raise ValueError("BOT_TOKEN is required")

    PORT = int(os.getenv("PORT", 8000))

    DOWNLOAD_PATH = os.getenv("DOWNLOAD_PATH", "downloads")
    MAX_FILE_SIZE_MB = int(os.getenv("MAX_FILE_SIZE_MB", 50))
    MAX_VIDEO_DURATION = int(os.getenv("MAX_VIDEO_DURATION", 120))
    DELETE_AFTER_MINUTES = int(os.getenv("DELETE_AFTER_MINUTES", 20))
    LOG_LEVEL = os.getenv("LOG_LEVEL", "INFO")

    @classmethod
    def validate(cls):
        """Validate configuration and create necessary directories."""
        if not cls.BOT_TOKEN:
            raise ValueError("BOT_TOKEN is required")
        cls.ensure_download_dir()

    @classmethod
    def ensure_download_dir(cls):
        os.makedirs(cls.DOWNLOAD_PATH, exist_ok=True)

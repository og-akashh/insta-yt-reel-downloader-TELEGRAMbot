# 🎥 Telegram Media Downloader Bot

Downloads Instagram Reels and YouTube Shorts. Auto-deletes after 20 minutes. Deploy on **Render** (free tier) with Docker.

## ✨ Features
- ✅ Download Instagram Reels & YouTube Shorts
- ⏰ Auto-delete local files after 20 minutes
- 🗑️ Auto-delete sent messages from chat
- 🐳 Dockerized for easy deployment
- 🔄 Health check endpoint for Render

## 🚀 Deploy on Render (Free)

1. **Fork this repo** to your GitHub account.

2. **Create a new Web Service** on [Render](https://render.com):
   - Connect your forked repo.
   - Environment: **Docker** (auto-detected).
   - Add environment variable: `BOT_TOKEN` = your token from [@BotFather](https://t.me/botfather).
   - (Optional) Adjust `DELETE_AFTER_MINUTES`, `MAX_FILE_SIZE_MB`.

3. **Click "Create Web Service"** – it will build and run.

4. **Keep it alive for free** – Use [UptimeRobot](https://uptimerobot.com) to ping `https://your-bot.onrender.com/health` every 5 minutes (prevents idle spin‑down).

## 📦 Local Development

```bash
git clone https://github.com/YOUR_USERNAME/telegram-media-bot
cd telegram-media-bot
cp .env.example .env   # add your BOT_TOKEN
docker-compose up --build

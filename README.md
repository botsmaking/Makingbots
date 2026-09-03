# SJ Shop — Telegram Mini App (Render)

One Render **Web Service** runs:
1. FastAPI mini app (`index.html` + APIs)
2. Telegram bot (background polling) when `BOT_TOKEN` is set

## 1. GitHub

```bash
unzip SJ-Shop-Render-Ready.zip -d sj-shop
cd sj-shop
git init
git add .
git commit -m "SJ Shop mini app"
git branch -M main
git remote add origin https://github.com/YOUR_USER/YOUR_REPO.git
git push -u origin main
```

## 2. Render

1. [render.com](https://render.com) → **New → Web Service** → connect the GitHub repo  
2. Settings:
   - **Runtime:** Python 3  
   - **Build:** `pip install -r requirements.txt`  
   - **Start:** `uvicorn app:app --host 0.0.0.0 --port $PORT`  
3. **Environment variables** (Environment tab):

| Key | Value |
|-----|--------|
| `BOT_TOKEN` | your Telegram bot token from @BotFather |
| `ADMIN_TG_IDS` | your Telegram numeric user id (comma-separated if many) |
| `SHOP_URL` | *(optional)* full HTTPS URL after first deploy, e.g. `https://sj-shop-xxxx.onrender.com` |

`RENDER_EXTERNAL_URL` is also read automatically after deploy. If menu button does not open the shop, set `SHOP_URL` explicitly to your Render URL.

4. Deploy → wait until status is **Live**.

## 3. Telegram

1. Open @BotFather → your bot  
2. Optional: `/setmenubutton` — usually the app sets it on startup  
3. Message your bot → `/start` → **Open SJ Shop**

Get your numeric Telegram id: message the bot `/id` (or any `@userinfobot`).

## 4. Local test (optional)

```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
export BOT_TOKEN="123:ABC"
export ADMIN_TG_IDS="YOUR_TG_ID"
export PORT=8000
uvicorn app:app --host 0.0.0.0 --port 8000
```

## Important

- **Do not commit a real bot token** to a public GitHub repo. Use Render **Environment** → `BOT_TOKEN`.  
- Free Render spins down after idle; first open can be slow (~30–60s).  
- Meesho session / accounts are managed inside the mini app + bot admin commands (`/grant`, `/topup`, …).

## Files

- `app.py` — API + serves mini app + starts bot thread  
- `bot.py` — Telegram commands / WebApp button  
- `index.html` — UI (UPI dynamic QR flow included)  
- `meesho_api.py` — Meesho HTTP client  
- `requirements.txt`, `render.yaml`, `Procfile`, `start.sh`

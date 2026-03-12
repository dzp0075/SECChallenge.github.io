# 🏈 SEC Football Pick’em — Web Application
A full‑featured SEC football pick’em platform with live ESPN data, preseason predictions, weekly picks, automated scoring, and real‑time leaderboards.
Built entirely with **vanilla JavaScript**, **HTML**, and **CSS**, and synced through a **Supabase backend**.

---

## 🚀 Features

### 🏈 Live ESPN Integration
- Fetches weekly College Football game data directly from ESPN’s public API  
- Parses matchups, kickoff times, scores, winners, and SEC vs. SEC flags  
- Automatically updates standings and results as games finish  

### 📝 Weekly Picks
- Users select winners for every SEC game each week  
- “Double‑Down” mechanic for bonus points  
- Automatic lockout at kickoff  
- Picks saved locally and synced to Supabase for multi‑device access

### 🔮 Preseason Predictions
- Rank all SEC teams (1–16)  
- Predict each team’s final record  
- Choose a “biggest upset” prediction  
- Full preseason scoring system:
  - Correct standings positions  
  - Exact record predictions  
  - Within‑one‑win predictions  
  - Correct upset pick  

### 📊 Real‑Time Leaderboard
- Weekly points + preseason points  
- Sorts players by total score  
- Hover/tap tooltips show detailed preseason scoring breakdown  
- Automatic recalculation when data updates  

### 🛠️ Admin Tools
- Sync any week or all weeks from ESPN
- Update scoring rules
- Manage teams and ESPN name mappings
- Publish league snapshots to Supabase
- Set actual preseason upset
- Reset the entire application

### 💾 State Management
- LocalStorage for fast client‑side state
- SessionStorage for active player identity
- Supabase (Postgres) for shared multi‑user data
- JSON import/export for backups

---

## 🧱 Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | HTML, CSS, Vanilla JavaScript |
| Backend | Supabase (Postgres + REST API) |
| Data Storage | Supabase + LocalStorage |
| API | ESPN College Football Scoreboard API |
| Deployment | GitHub Pages |

---

## 📂 Project Structure

```
index.html          ← full application (HTML + CSS + JS)
supabase-setup.sql  ← run once in Supabase SQL Editor to create the picks table
```

Everything runs client‑side. Supabase is used only for syncing picks across devices.

---

## 🔧 Setup & Usage

### 1. Clone the repo
```bash
git clone https://github.com/<your-username>/<repo-name>.git
```

### 2. Open `index.html` in a browser  
No build step. No dependencies.

### 3. Configure Supabase backend
1. Create a free project at [supabase.com](https://supabase.com)
2. Run `supabase-setup.sql` in your project's **SQL Editor**
3. Find your credentials:
   - **Project URL** — on your project's home page
   - **Anon key** — **Settings → API Keys → Legacy anon, service_role API keys → `anon`**
4. Paste them into `index.html`:

```js
const SUPABASE_URL      = "https://your-project.supabase.co";
const SUPABASE_ANON_KEY = "eyJ...";
```

### 4. Deploy via GitHub Pages  
Enable Pages → point to root.

---

## 🧪 Admin Mode

Click **Admin** and enter your PIN:

```js
const ADMIN_PIN = "1234";
```

Admin mode unlocks:

- Sync Week / Sync All Weeks  
- Save scoring rules  
- Save team mappings  
- Save actual preseason upset  
- Publish league snapshot  

---

## 📤 Import / Export

- **Export** → downloads `sec-picks-data.json`  
- **Import** → loads a previously exported file  

Useful for backups or migrating seasons.

---

## 🗺️ ESPN Name Mapping

Because ESPN uses inconsistent team names, you can map them manually:

```
Mississippi State = Mississippi St
Texas A&M = Texas A&M Aggies
```

This ensures accurate SEC detection and standings.

---

## 🏆 Scoring Summary

### Weekly
- Correct pick: **+1**  
- Double‑down correct: **+2**  

### Preseason
- Correct standings position: **+2**  
- Exact record: **+3**  
- Within one win: **+1**  
- Correct upset: **+5**  

(Values configurable in the admin panel.)

---

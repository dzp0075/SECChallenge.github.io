# 📘 SEC Football Pick’em — Web Application  
A full‑featured SEC football pick’em platform with live ESPN data, preseason predictions, weekly picks, automated scoring, and real‑time leaderboards.  
Built entirely with **vanilla JavaScript**, **HTML**, and **CSS**, and synced through a **serverless Google Sheets backend**.

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
- Picks saved locally and synced to Google Sheets for multi‑device access  

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
- Publish league snapshots to Google Sheets  
- Set actual preseason upset  
- Reset the entire application  

### 💾 State Management
- LocalStorage for fast client‑side state  
- SessionStorage for active player identity  
- Google Sheets for shared multi‑user data  
- JSON import/export for backups  

---

## 🧱 Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | HTML, CSS, Vanilla JavaScript |
| Backend | Google Apps Script Web App (serverless) |
| Data Storage | Google Sheets + LocalStorage |
| API | ESPN College Football Scoreboard API |
| Deployment | GitHub Pages |

---

## 📂 Project Structure

```
index.html
└── <script> … full application logic … </script>
└── <style> … custom dark UI theme … </style>
```

Everything runs client‑side except the Google Sheets sync endpoint.

---

## 🔧 Setup & Usage

### 1. Clone the repo
```bash
git clone https://github.com/<your-username>/<repo-name>.git
```

### 2. Open `index.html` in a browser  
No build step. No dependencies.

### 3. (Optional) Configure Google Sheets backend  
Deploy a Google Apps Script Web App and update:

```js
const SHEETS_WEBAPP_URL = "https://script.google.com/macros/s/XXXXX/exec";
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

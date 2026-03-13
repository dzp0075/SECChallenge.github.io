# 🏈 SEC Football Pick'em — Web Application

A full-featured SEC football pick'em platform with live ESPN data, preseason predictions, weekly picks, automated scoring, and real-time leaderboards.
Built entirely with **vanilla JavaScript**, **HTML**, and **CSS**, synced through a **Supabase** backend, and automatically updated via **GitHub Actions**.

---

## 🚀 Features

### 🏈 Live ESPN Integration
- Fetches weekly College Football game data directly from ESPN's public API
- Parses matchups, kickoff times, scores, winners, and SEC vs. SEC flags
- Displays kickoff time in Eastern time with **TBD** when not yet announced
- Automatically updates standings and results as games finish

### 📝 Weekly Picks
- Pick a winner for every SEC game each week
- **Double-Down** mechanic — choose one game per week worth 2x points
- Pick dropdown and 2x button shown inline on each game card
- Automatic lockout at the first kickoff of each week
- Picks synced to Supabase for cross-device access

### 🔮 Preseason Predictions
- Rank all 16 SEC teams by predicted final standings
- Predict each team's win-loss record
- Choose a "biggest upset" prediction
- Locked automatically when Week 1 kicks off
- Full scoring system:
  - Correct standings position: **+2**
  - Exact record: **+3**
  - Within one win: **+1**
  - Correct upset pick: **+5**

### 📊 Real-Time Leaderboard
- Weekly points + preseason points combined
- Sorts players by total score
- Hover/tap to see detailed preseason scoring breakdown

### 🛠️ Admin Tools
- Sync any week or all weeks from ESPN
- Update scoring rules
- Manage teams and ESPN name mappings
- Publish league snapshot to Supabase
- Set actual preseason upset result
- Reset the entire application

### ⚙️ Automatic ESPN Sync (GitHub Actions)
- Weekly cron job runs every **Tuesday at 2 AM UTC**
- Fetches all 14 weeks from ESPN and updates Supabase automatically
- Manually triggerable anytime from the GitHub Actions tab
- Requires `SUPABASE_URL` and `SUPABASE_ANON_KEY` set as repository secrets

### 📱 Mobile-Friendly UI
- Responsive layout — single column on mobile, multi-column on desktop
- Fixed bottom tab bar on mobile: **Picks / Scores / Standings / Setup**
- Each card is its own tab — tap to switch views
- Scrollable scoreboard table on small screens

---

## 🧱 Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | HTML, CSS, Vanilla JavaScript |
| Backend | Supabase (Postgres + REST API) |
| Data | Supabase only — no localStorage |
| API | ESPN College Football Scoreboard API |
| Automation | GitHub Actions (weekly cron sync) |
| Deployment | GitHub Pages |

---

## 📂 Project Structure

```
index.html                        ← full application (HTML + CSS + JS)
supabase-setup.sql                ← run once to create the picks table
supabase-admin-config.sql         ← run once to create the config table (admin PIN)
.github/workflows/espn-sync.yml  ← weekly auto-sync GitHub Action
```

---

## 🔧 Setup & Usage

### 1. Clone the repo
```bash
git clone https://github.com/<your-username>/<repo-name>.git
```

### 2. Configure Supabase
1. Create a free project at [supabase.com](https://supabase.com)
2. Run `supabase-setup.sql` in your project's **SQL Editor**
3. Run `supabase-admin-config.sql` to create the config table and set your admin PIN
4. Find your credentials:
   - **Project URL** — on your project's home page
   - **Anon key** — **Settings → API Keys → `anon`**
5. Paste them into `index.html`:

```js
const SUPABASE_URL      = "https://your-project.supabase.co";
const SUPABASE_ANON_KEY = "eyJ...";
```

### 3. Deploy via GitHub Pages
Enable Pages → point to root → site is live at `https://<username>.github.io/<repo-name>`.

### 4. Set up auto-sync (optional)
1. Go to **Settings → Secrets and variables → Actions**
2. Add `SUPABASE_URL` and `SUPABASE_ANON_KEY` as repository secrets
3. The workflow in `.github/workflows/espn-sync.yml` will run every Tuesday automatically
4. You can also trigger it manually from the **Actions** tab

---

## 🧪 Admin Mode

Click **Admin** and enter your PIN (set via `supabase-admin-config.sql`, default `1234`).

Admin mode unlocks:
- Sync Week / Sync All Weeks from ESPN
- Save scoring rules
- Manage team name mappings
- Set actual preseason upset result
- Publish league snapshot to Supabase

---

## 🏆 Scoring Summary

### Weekly
- Correct pick: **+1**
- Double-down correct: **+2** (instead of +1)

### Preseason
- Correct standings position: **+2**
- Exact record: **+3**
- Within one win: **+1**
- Correct upset pick: **+5**

All values are configurable in the admin panel.

---

## 🗺️ ESPN Name Mapping

ESPN uses inconsistent team name abbreviations. You can map them manually in the admin panel:

```
Mississippi State = Mississippi St
Texas A&M = Texas A&M Aggies
```

This ensures accurate SEC detection and standings calculations.

---

## 📤 Import / Export

- **Export** — downloads `sec-picks-data.json` as a backup
- **Import** — restores a previously exported file

Useful for migrating seasons or backing up data.

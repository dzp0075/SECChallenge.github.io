# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

SEC Football Pick'em Platform — a single-page application for tracking weekly SEC football picks, preseason predictions, and a live leaderboard. Data syncs across devices via Google Sheets; live scores come from the ESPN public API.

## Development

No build process. Open `index.html` directly in a browser. There are no dependencies, package managers, or build tools.

## Architecture

The entire application lives in a single file: `index.html` (~2200 lines). It contains all HTML, CSS, and JavaScript.

### State

A global `state` object is persisted to `localStorage` under key `"sec_picks_espn_v1"`. `loadState()` hydrates it on startup; `saveState()` writes it back. The active user is tracked via `sessionStorage` (`SESSION_PLAYER_KEY`, `SESSION_PLAYER_NAME_KEY`, `ADMIN_FLAG_KEY`).

### Key data shapes

- `state.players[]` — each player has `id`, `name`, and `preseason` (predicted standings order, W/L records, biggest upset pick)
- `state.weeks[]` — 14 weeks, each with `games[]` and `picks` keyed by player ID
- `state.teamMap` — ESPN team name → local name mappings (must stay consistent across devices)
- `state.scoring` — configurable point values for each achievement type

### Module layout (by line range)

| Lines | Purpose |
|-------|---------|
| 1–500 | HTML structure + CSS (dark theme with CSS variables) |
| 501–550 | Constants, ESPN API base, storage key |
| 551–841 | Google Sheets sync (`sheetsSavePlayerPayload`, `sheetsLoadSeason`, `publishLeagueToSheets`, etc.) |
| 843–963 | Player management / auth (`loginExistingPlayer`, `createNewPlayer`, `adminLogin`, `logout`) |
| 964–1003 | Persistence helpers (`loadState`, `saveState`) |
| 1005–1108 | Week/game management (`ensureWeekExists`, `isWeekLocked`, `weekLockTime`) |
| 1109–1195 | ESPN integration (`fetchESPNScoreboard`, `parseESPNGames`, `mergeGamesPreservePicks`) |
| 1196–1523 | UI helpers and pick submission logic |
| 1524–1607 | Scoring engine (`weeklyPointsForPlayer`, `computePreseasonBreakdownForPlayer`) |
| 1608–1789 | Rendering functions (`renderAll`, `renderPlayers`, `renderWeeks`, `renderScoreboard`, etc.) |
| 1790–2200 | ESPN sync triggers, event binding, initialization |

### Initialization flow

1. `loadState()` from localStorage (or create defaults)
2. `ensureWeekExists()` for all 14 weeks
3. Bind event listeners
4. Async: load league snapshot + all player picks from Google Sheets
5. `renderAll()`

### Key utilities

```javascript
const norm = (s) => ...        // normalize team names for comparison
const uid = () => ...          // generate unique IDs
const $ = (id) => ...          // document.getElementById shorthand
gameKey(g)                     // stable cross-device game identifier
localNameFromESPN(espnName)    // resolve ESPN name to local name via state.teamMap
```

### External dependencies

- **ESPN API** — `https://site.api.espn.com/apis/site/v2/sports/football/college-football/scoreboard`
- **Google Apps Script Web App** — URL hardcoded near line 552; handles Sheets read/write as the sync backend

### Admin mode

Enter PIN `1234` (hardcoded near line 935) to unlock admin controls: bulk ESPN sync, league publishing, game result entry, and config editing.

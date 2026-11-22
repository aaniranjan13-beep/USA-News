# USA NEWS 24 - CNN-Style News Website with Editorial Admin Panel & Auto-Updater

A production-ready, full-stack American news portal modeled after **[CNN Edition](https://edition.cnn.com/)**, complete with a real-time **Editorial Command Admin Panel** and **Automated Live News Ingestion Engine**.

---

## 🌟 Key Features

### 1. CNN-Style Public Front Page
* **Iconic CNN Masthead**: Bold red "US" emblem, live US Eastern time clock, Washington D.C. live weather, and streaming audio badge.
* **Breaking News Alert Ticker**: Pulsing red alert marquee across the top of every page.
* **Wall Street Market Ticker**: Real-time financial indices (S&P 500, Dow Jones, Nasdaq, 10-Yr Yield, Crude Oil, Gold).
* **3-Tier Hero Showcase**:
  * **Main Lead Story**: Massive hero headline with high-resolution photo, bulleted key developments, and byline.
  * **Secondary Headlines**: 3-column top story stack.
  * **Live Radar & Fast Briefs**: Developing news stream with audio dispatch indicators.
* **Category Hubs**: Dedicated sections for **US National**, **Politics & Capitol Hill**, **Business & Economy**, **Tech & AI**, **Entertainment**, **Sports**, **Opinion**, and **Health**.
* **Article Detail Reader**:
  * Clean editorial typography (drop-cap styling, pull quotes, photo credits).
  * One-click link sharing & article bookmarking.
  * Related stories recommendation column.
* **Search & Filters**: Instant multi-keyword search and category navigation.

### 2. Editorial Command Admin Panel (`/admin`)
* **Live WebSocket / SSE Synchronization**: Any edits, deletions, or new articles created in the admin panel are broadcast instantly to all connected reader screens without reloading.
* **Breaking News Marquee Controller**: Instantly rewrite and broadcast breaking headlines to the top red banner.
* **Comprehensive Article Manager**:
  * **Create New Articles**: With headline, slug, category, author byline, image URL (with live preview and preset stock photography), image caption, lead summary, and full multi-paragraph body.
  * **Edit Any Existing Article**: Modify any story (both editorial and wire-ingested).
  * **One-Click Hero Assignment**: Star (★) any article to become the primary homepage lead.
  * **One-Click Breaking Toggle**: Flag any article with the flaming "BREAKING" badge.
  * **Delete Story**: Instant removal with live broadcast.
* **Passcode Protection**: Secure login prompt (Default demo passcode: `admin123`).

### 3. Automated Wire News Ingestion Engine
* Automatically connects to active US news wire feeds (**NPR US National**, **CNN Top Stories**, **NPR Politics**, **NPR Business**, **NPR Tech**).
* Pulls new headlines, extracts content and photo metadata, and normalizes them into your local database.
* **Configurable Cadence**: Automatically updates every 1, 5, 15, or 30 minutes in the background.
* **Manual "Sync Now" Button**: Instant 1-click fetch button in the Admin Panel to pull the latest breaking news on demand.

---

## 🚀 Quick Start Guide

### Prerequisites
* **Node.js**: v18+ (verified on Node v24)
* **npm**: v9+

### Running the Website

The backend server serves both the REST API and the production-optimized frontend on port 4000:

```bash
npm start
```
Then open your browser at:
👉 **[http://localhost:4000](http://localhost:4000)**

### Accessing the Admin Panel
1. Click the red **"ADMIN PANEL"** button in the top right of the website header (or access it from the footer).
2. Enter the passcode:
   ```
   admin123
   ```
3. You now have full access to create, edit, delete articles, broadcast breaking banners, and trigger automatic news syncs.

---

## 📂 Project Architecture

```
d:\USA news Website\
├── package.json              # Root scripts and runner
├── server/                   # Backend Express & Live Ingest Server
│   ├── server.js             # REST API + Server-Sent Events (SSE) live broadcaster
│   ├── db.js                 # Safe transactional JSON database engine
│   ├── rssService.js         # Automated US news wire fetcher & scheduler
│   └── data/
│       └── news.json         # Persistent article storage & site settings
└── client/                   # Frontend React + Tailwind CSS
    ├── src/
    │   ├── api.js            # API client & live stream subscriber
    │   ├── App.jsx           # Main application state & routing
    │   ├── components/
    │   │   ├── Header.jsx           # CNN masthead, clock, weather & nav
    │   │   ├── BreakingBanner.jsx   # Top pulsing breaking alert ticker
    │   │   ├── MarketTicker.jsx     # Wall Street financial ticker
    │   │   ├── HeroSection.jsx      # CNN 3-tier lead layout
    │   │   ├── CategorySection.jsx  # 4-card themed category showcases
    │   │   ├── ArticleDetail.jsx    # Full reader view with social share
    │   │   ├── AdminPanel.jsx       # Complete editorial command center
    │   │   ├── AdminLoginModal.jsx  # Passcode security modal
    │   │   └── Footer.jsx           # CNN-style deep legal and category footer
    └── dist/                 # Production-built bundle served by Express
```

---

## ⚡ Real-Time Auto-Update Demonstration

1. Open **[http://localhost:4000](http://localhost:4000)** in two browser windows side by side.
2. In one window, click **"ADMIN PANEL"** and enter `admin123`.
3. In the **"LIVE BREAKING NEWS TICKER BANNER"** input, type a new breaking headline and click **"Broadcast Alert"**.
4. Observe the other window: the red breaking banner updates instantly without a page reload!
5. In the Admin Panel, click **"⚡ Fetch Latest News Now"**: watch fresh live US news articles appear in real time.

 IPL Analytics Hub

A full-stack cricket intelligence platform that transforms 18years of IPL match data into interactive, real-time insights. Explore team stats, head-to-head records, season analysis, and more — all wrapped in a sleek, team-colored UI.

 **Live Demo:** [ipl-statshub.vercel.app](https://ipl-statshub.vercel.app)

---

## Features

- **Team Stats** — Win/loss records, win percentages, and performance metrics for all 18 franchises
- **Head-to-Head Analysis** — Compare any two teams across all IPL encounters
- **Season Breakdown** — Drill into team performance for any specific IPL season
- **Season H2H** — Head-to-head stats filtered by season for granular insights
- **Dynamic Team Theming** — UI adapts to each team's brand colors in real-time
- **Animated Team Cards** — Staggered reveal animations with trophy overlays for title winners
- **Responsive Design** — Optimized for desktop, tablet, and mobile

---

##  Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | React 19, Tailwind CSS 4, React Router 7 |
| **Build Tool** | Vite 7 |
| **Backend** | Spring Boot 3, Java 17 |
| **Database** | PostgreSQL |
| **Deployment** | Vercel (frontend), Render (backend) |

---

##  Project Structure

```
IPL_app/
├── frontend/                  # React SPA
│   ├── public/                # Static assets & team logos
│   ├── src/
│   │   ├── api/               # API service layer (rcbApi.js)
│   │   ├── assets/            # Images & icons
│   │   ├── components/        # Reusable components (Navbar, Footer)
│   │   ├── pages/             # Page components (Home, Stats, About)
│   │   ├── App.jsx            # Layout & routing
│   │   ├── main.jsx           # Entry point
│   │   └── index.css          # Global styles & Tailwind theme
│   ├── index.html
│   ├── vite.config.js
│   └── package.json
├── src/                       # Spring Boot backend
│   └── main/java/...          # Controllers, Services, Models, Repositories
├── db_dump.sql                # Database schema & seed data
├── Dockerfile                 # Backend container config
└── pom.xml                    # Maven dependencies
```

---

##  Getting Started

### Prerequisites

- **Node.js** 18+
- **Java** 17+
- **PostgreSQL** 15+
- **Maven** 3.8+

### Backend Setup

```bash
# 1. Create the database
psql -U postgres -c "CREATE DATABASE ipl_db;"

# 2. Import the data
psql -U postgres -d ipl_db -f db_dump.sql

# 3. Configure database connection in application.properties
# spring.datasource.url=jdbc:postgresql://localhost:5432/ipl_db

# 4. Run the backend
./mvnw spring-boot:run
```

The API will be available at `http://localhost:8080`

### Frontend Setup

```bash
cd frontend
npm install
npm run dev
```

The app will be available at `http://localhost:5173`

---

##  API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/rcb/teams` | List all IPL teams |
| GET | `/rcb/seasons` | List all IPL seasons |
| GET | `/rcb/team/stats?team_id={id}` | Stats for a specific team |
| GET | `/rcb/team/season/stats?season={year}&team_id={id}` | Team stats for a season |
| GET | `/rcb/team1_team2/stats?team_id={id}&team2_id={id}` | Head-to-head stats |
| GET | `/rcb/team1_team2/season/stats?team1_id={id}&team2_id={id}&season={year}` | Season H2H stats |

<img width="1916" height="911" alt="image" src="https://github.com/user-attachments/assets/39b56c41-d8f2-4c63-b99b-90d24643795d" />

<img width="1896" height="912" alt="image" src="https://github.com/user-attachments/assets/24ea8b75-1f13-4f10-8ca9-24c85d20378d" />

<img width="1887" height="910" alt="image" src="https://github.com/user-attachments/assets/42241ad8-fb88-43fb-ba3e-1ef105dbec3a" />



<img width="1900" height="913" alt="image" src="https://github.com/user-attachments/assets/d8af42cb-6eb0-444c-a975-6e01c7ed8e68" />







##  Key Technical Decisions

- **Normalized database schema** over denormalized flat tables — enables flexible queries across teams, matches, and seasons without data duplication
- **REST API with statistical aggregation** — backend handles complex calculations (win %, head-to-head records) so the frontend stays lightweight
- **Single Page Application** — React Router enables instant page transitions without full page reloads
- **CSS variables for team theming** — dynamic `style` attributes allow team brand colors to flow through the entire UI without hardcoded Tailwind classes
- **Staggered animations** — `setTimeout` with index-based delays creates a polished sequential reveal effect

---

##  License

This project is for educational and portfolio purposes and for the real cricket geeks.

---

## 👤 Author

**Deepak Reddy Gunreddy**

- GitHub: [@DEEPAKREDDYGUNREDDY](https://github.com/DEEPAKREDDYGUNREDDY)

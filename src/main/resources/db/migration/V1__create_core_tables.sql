-- Seasons (IPL years)
create table if not exists season (
                                      id bigserial primary key,
                                      year int not null unique
);

-- Teams (RCB, MI, CSK, etc.)
create table if not exists team (
                                    id bigserial primary key,
                                    name varchar(100) not null unique
    );

-- Matches (one row per match)
create table if not exists match (
                                     id bigint primary key,               -- match id from JSON filename
                                     season_year int not null,            -- easier querying by year
                                     match_date date,

                                     team1_id bigint references team(id),
    team2_id bigint references team(id),

    venue text,
    city text,

    toss_winner_id bigint references team(id),
    toss_decision varchar(20),

    winner_id bigint references team(id),
    result_type varchar(50),
    result_margin int,

    created_at timestamptz not null default now()
    );

create index if not exists idx_match_season_date on match(season_year, match_date);
create index if not exists idx_match_team1 on match(team1_id);
create index if not exists idx_match_team2 on match(team2_id);
const BASE = '/rcb';

export async function getTeams() {
  const res = await fetch(`${BASE}/teams`);
  return res.json();
}

export async function getSeasons() {
  const res = await fetch(`${BASE}/seasons`);
  return res.json();
}

export async function getTeamStats(teamId) {
  const res = await fetch(`${BASE}/team/stats?team_id=${teamId}`);
  return res.json();
}

export async function getSeasonStats(season, teamId) {
  const res = await fetch(`${BASE}/team/season/stats?season=${season}&team_id=${teamId}`);
  return res.json();
}

export async function getH2HStats(teamId, team2Id) {
  const res = await fetch(`${BASE}/team1_team2/stats?team_id=${teamId}&team2_id=${team2Id}`);
  return res.json();
}

export async function getH2HSeasonStats(team1Id, team2Id, season) {
  const res = await fetch(`${BASE}/team1_team2/season/stats?team1_id=${team1Id}&team2_id=${team2Id}&season=${season}`);
  return res.json();
}

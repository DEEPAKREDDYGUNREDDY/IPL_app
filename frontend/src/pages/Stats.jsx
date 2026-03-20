import { useEffect, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import {
  getTeams,
  getSeasons,
  getTeamStats,
  getSeasonStats,
  getH2HStats,
  getH2HSeasonStats,
} from '../api/rcbApi'

const TEAM_COLORS = {
  'RCB': '#E41E26', 'MI': '#1E90FF', 'CSK': '#FFCB05', 'KKR': '#9B59B6',
  'SRH': '#FF822A', 'DC': '#4A90D9', 'DD': '#4A90D9', 'RR': '#E73895',
  'PBKS': '#ED1B24', 'KXIP': '#ED1B24', 'LSG': '#D63384', 'GT': '#B8860B',
  'DCG': '#DAA520', 'PW': '#2F9BE3', 'PWI': '#2F9BE3', 'RPS': '#8B5CF6',
  'GL': '#E04F16', 'KTK': '#8B5CF6',
}

/* ── SVG Icon Components ── */
function IconBarChart({ color = 'currentColor', size = 18 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <rect x="3" y="12" width="4" height="9" rx="1" /><rect x="10" y="7" width="4" height="14" rx="1" /><rect x="17" y="3" width="4" height="18" rx="1" />
    </svg>
  )
}
function IconCalendar({ color = 'currentColor', size = 18 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <rect x="3" y="4" width="18" height="18" rx="2" /><line x1="16" y1="2" x2="16" y2="6" /><line x1="8" y1="2" x2="8" y2="6" /><line x1="3" y1="10" x2="21" y2="10" />
    </svg>
  )
}
function IconSwords({ color = 'currentColor', size = 18 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M5.2 19.8L2 22l1-3.2 12-12L17.2 9z" /><path d="M18.8 4.2L22 2l-1 3.2-12 12L6.8 15z" /><path d="M15 9l-6 6" />
    </svg>
  )
}
function IconCricket({ color = 'currentColor', size = 18 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <circle cx="12" cy="5" r="3" /><line x1="12" y1="8" x2="12" y2="22" /><line x1="7" y1="13" x2="17" y2="13" />
    </svg>
  )
}
function IconStadium({ color = 'currentColor', size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <ellipse cx="12" cy="8" rx="9" ry="4" /><path d="M3 8v6c0 2.2 4 4 9 4s9-1.8 9-4V8" />
    </svg>
  )
}
function IconCheckCircle({ color = 'currentColor', size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <circle cx="12" cy="12" r="10" /><path d="M9 12l2 2 4-4" />
    </svg>
  )
}
function IconXCircle({ color = 'currentColor', size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <circle cx="12" cy="12" r="10" /><path d="M15 9l-6 6" /><path d="M9 9l6 6" />
    </svg>
  )
}
function IconCloudRain({ color = 'currentColor', size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M20 16.2A5 5 0 0018 7h-1.26A8 8 0 104 15.25" /><path d="M8 19v2" /><path d="M12 19v2" /><path d="M16 19v2" />
    </svg>
  )
}
function IconTrophy({ color = 'currentColor', size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M6 9H3a1 1 0 01-1-1V5a1 1 0 011-1h3" /><path d="M18 9h3a1 1 0 001-1V5a1 1 0 00-1-1h-3" /><path d="M6 4h12v6a6 6 0 01-12 0V4z" /><path d="M10 16h4" /><path d="M12 16v4" /><path d="M8 20h8" />
    </svg>
  )
}
function IconAlertTriangle({ color = 'currentColor', size = 28 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M10.29 3.86L1.82 18a2 2 0 001.71 3h16.94a2 2 0 001.71-3L13.71 3.86a2 2 0 00-3.42 0z" /><line x1="12" y1="9" x2="12" y2="13" /><line x1="12" y1="17" x2="12.01" y2="17" />
    </svg>
  )
}
function IconMapPin({ color = 'currentColor', size = 14 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z" /><circle cx="12" cy="10" r="3" />
    </svg>
  )
}

const TABS = [
  { id: 'team', label: 'Team Stats', Icon: IconBarChart },
  { id: 'season', label: 'Season Stats', Icon: IconCalendar },
  { id: 'h2h', label: 'Head to Head', Icon: IconSwords },
  { id: 'h2hseason', label: 'H2H by Season', Icon: IconCricket },
]

function StatCard({ label, value, icon: IconComp, iconColor, color }) {
  return (
    <div
      className="relative overflow-hidden rounded-2xl p-5 border border-white/5 group hover:border-white/10 transition-all duration-300"
      style={{ background: 'linear-gradient(135deg, #16213E, #1a1a2e)' }}
    >
      <div className="absolute top-0 right-0 w-20 h-20 rounded-full blur-3xl opacity-10 group-hover:opacity-20 transition-opacity" style={{ backgroundColor: color || '#2563EB' }} />
      <p className="text-gray-400 text-xs uppercase tracking-wider mb-2 flex items-center gap-1.5">
        {IconComp && <IconComp color={iconColor || color || '#94a3b8'} size={14} />}
        {label}
      </p>
      <p className="text-3xl font-extrabold tracking-tight" style={{ color: color || '#fff' }}>
        {value}
      </p>
    </div>
  )
}

function Select({ label, value, onChange, options, valueKey = 'id', labelKey = 'name' }) {
  return (
    <div>
      <label className="block text-xs uppercase tracking-wider text-gray-500 mb-2 font-medium">{label}</label>
      <div className="relative">
        <select
          value={value}
          onChange={(e) => onChange(e.target.value)}
          className="w-full bg-rcb-darker border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-ipl-blue/50 focus:ring-1 focus:ring-ipl-blue/30 appearance-none cursor-pointer transition-all hover:border-white/20 text-sm"
        >
          <option value="">-- Select --</option>
          {options.map((opt) => (
            <option key={opt[valueKey]} value={opt[valueKey]}>
              {opt[labelKey]}
            </option>
          ))}
        </select>
        <div className="absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none text-gray-500">
          <svg width="12" height="12" viewBox="0 0 12 12" fill="none"><path d="M3 4.5L6 7.5L9 4.5" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/></svg>
        </div>
      </div>
    </div>
  )
}

function WinBar({ team1Name, team2Name, team1Wins, team2Wins, team1Color, team2Color }) {
  const total = team1Wins + team2Wins || 1
  const pct1 = (team1Wins / total) * 100
  return (
    <div className="mt-6 mb-2">
      <div className="flex justify-between text-sm mb-2">
        <span className="font-semibold" style={{ color: team1Color }}>{team1Name} ({team1Wins})</span>
        <span className="font-semibold" style={{ color: team2Color }}>{team2Name} ({team2Wins})</span>
      </div>
      <div className="h-3 rounded-full overflow-hidden flex bg-rcb-darker border border-white/5">
        <div
          className="h-full rounded-l-full transition-all duration-700"
          style={{ width: `${pct1}%`, background: `linear-gradient(90deg, ${team1Color}, ${team1Color}aa)` }}
        />
        <div
          className="h-full rounded-r-full transition-all duration-700"
          style={{ width: `${100 - pct1}%`, background: `linear-gradient(90deg, ${team2Color}aa, ${team2Color})` }}
        />
      </div>
    </div>
  )
}

function Stats() {
  const [searchParams] = useSearchParams()
  const [activeTab, setActiveTab] = useState('team')
  const [teams, setTeams] = useState([])
  const [seasons, setSeasons] = useState([])

  const [teamId, setTeamId] = useState(searchParams.get('team') || '')
  const [team2Id, setTeam2Id] = useState('')
  const [season, setSeason] = useState('')

  const [result, setResult] = useState(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  useEffect(() => {
    Promise.all([getTeams(), getSeasons()])
      .then(([t, s]) => {
        setTeams(t)
        setSeasons(s.sort((a, b) => b.year - a.year))
      })
      .catch(() => setError('Could not connect to backend. Please start the Spring Boot server.'))
  }, [])

  useEffect(() => {
    const preselected = searchParams.get('team')
    if (preselected && teams.length > 0) {
      setTeamId(preselected)
      handleFetch('team', preselected)
    }
  }, [teams])

  function getTeamColor(id) {
    const team = teams.find((t) => String(t.id) === String(id))
    return TEAM_COLORS[team?.name] || '#2563EB'
  }

  async function handleFetch(tab, overrideTeamId) {
    const tid = overrideTeamId || teamId
    setError('')
    setResult(null)
    setLoading(true)
    try {
      let data
      switch (tab || activeTab) {
        case 'team':
          if (!tid) throw new Error('Please select a team')
          data = await getTeamStats(tid)
          break
        case 'season':
          if (!tid || !season) throw new Error('Please select both team and season')
          data = await getSeasonStats(season, tid)
          break
        case 'h2h':
          if (!tid || !team2Id) throw new Error('Please select both teams')
          data = await getH2HStats(tid, team2Id)
          break
        case 'h2hseason':
          if (!tid || !team2Id || !season) throw new Error('Please select both teams and a season')
          data = await getH2HSeasonStats(tid, team2Id, season)
          break
      }
      setResult(data)
    } catch (err) {
      setError(err.message || 'Failed to fetch stats')
    } finally {
      setLoading(false)
    }
  }

  function getTeamName(id) {
    const team = teams.find((t) => String(t.id) === String(id))
    return team?.name || 'Team'
  }

  function getTeamLogo(id) {
    const name = getTeamName(id)
    return `/logos/${name.toLowerCase()}.png`
  }

  // Derive accent color from selected team for the whole page
  const primaryColor = getTeamColor(teamId)

  function renderResult() {
    if (loading) {
      return (
        <div className="text-center py-16">
          <div className="w-12 h-12 border-4 rounded-full animate-spin mx-auto" style={{ borderColor: `${primaryColor}33`, borderTopColor: primaryColor }} />
          <p className="text-gray-500 mt-4 text-sm">Crunching the numbers...</p>
        </div>
      )
    }
    if (error) {
      return (
        <div className="text-center py-12">
          <div className="mb-3 flex justify-center">
            <IconAlertTriangle color="#f87171" size={36} />
          </div>
          <p className="text-red-400 font-medium">{error}</p>
        </div>
      )
    }
    if (!result) {
      return (
        <div className="text-center py-16">
          <div className="mb-4 flex justify-center opacity-30">
            <IconBarChart color="#94a3b8" size={48} />
          </div>
          <p className="text-gray-500">Select options above and click <span className="font-semibold" style={{ color: primaryColor }}>Get Stats</span> to see results</p>
        </div>
      )
    }

    const teamColor = getTeamColor(teamId)

    if (activeTab === 'team') {
      const matches = result.total_matchesPlayed ?? result.Total_matchesPlayed ?? 0
      const wins = result.wins ?? 0
      const losses = result.losses ?? 0
      const nr = result.no_Result ?? result.No_Result ?? 0
      const winPct = parseFloat(result.win_percentage) || 0
      return (
        <div>
          {/* Team Header */}
          <div className="flex items-center gap-4 mb-6">
            <img src={getTeamLogo(teamId)} alt="" className="w-14 h-14 object-contain drop-shadow-lg" onError={(e) => e.target.style.display = 'none'} />
            <div>
              <h3 className="text-2xl font-bold text-white">{getTeamName(teamId)}</h3>
              <p className="text-sm" style={{ color: teamColor + '99' }}>Overall Performance</p>
            </div>
          </div>

          {/* Win percentage ring */}
          <div className="flex flex-col items-center mb-8">
            <div className="relative w-32 h-32">
              <svg viewBox="0 0 120 120" className="w-full h-full -rotate-90">
                <circle cx="60" cy="60" r="52" fill="none" stroke="#1a1a2e" strokeWidth="10" />
                <circle
                  cx="60" cy="60" r="52" fill="none"
                  stroke={teamColor}
                  strokeWidth="10"
                  strokeLinecap="round"
                  strokeDasharray={`${winPct * 3.267} 326.7`}
                  className="transition-all duration-1000"
                />
              </svg>
              <div className="absolute inset-0 flex flex-col items-center justify-center">
                <span className="text-2xl font-extrabold" style={{ color: teamColor }}>{winPct.toFixed(1)}%</span>
                <span className="text-[10px] text-gray-500 uppercase tracking-wider">Win Rate</span>
              </div>
            </div>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <StatCard label="Matches Played" value={matches} icon={IconStadium} iconColor={teamColor} color={teamColor} />
            <StatCard label="Wins" value={wins} icon={IconCheckCircle} iconColor="#4ade80" color="#4ade80" />
            <StatCard label="Losses" value={losses} icon={IconXCircle} iconColor="#f87171" color="#f87171" />
            <StatCard label="No Result" value={nr} icon={IconCloudRain} iconColor="#facc15" color="#facc15" />
          </div>
        </div>
      )
    }

    if (activeTab === 'season') {
      const matches = result.totalmatchesPlayed ?? result.TotalmatchesPlayed ?? 0
      const wins = result.totalWins ?? result.TotalWins ?? 0
      const losses = result.totalloss ?? result.Totalloss ?? 0
      const draws = result.totalDraws ?? result.TotalDraws ?? 0
      return (
        <div>
          <div className="flex items-center gap-4 mb-6">
            <img src={getTeamLogo(teamId)} alt="" className="w-14 h-14 object-contain drop-shadow-lg" onError={(e) => e.target.style.display = 'none'} />
            <div>
              <h3 className="text-2xl font-bold text-white">{getTeamName(teamId)}</h3>
              <p className="text-sm" style={{ color: teamColor + '99' }}>Season {season} Performance</p>
            </div>
            <div className="ml-auto">
              <span className="text-4xl font-extrabold" style={{ color: teamColor }}>{season}</span>
            </div>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <StatCard label="Matches Played" value={matches} icon={IconStadium} iconColor={teamColor} color={teamColor} />
            <StatCard label="Wins" value={wins} icon={IconCheckCircle} iconColor="#4ade80" color="#4ade80" />
            <StatCard label="Losses" value={losses} icon={IconXCircle} iconColor="#f87171" color="#f87171" />
            <StatCard label="Draws / NR" value={draws} icon={IconCloudRain} iconColor="#facc15" color="#facc15" />
          </div>

          {/* Season win bar */}
          {matches > 0 && (
            <div className="mt-6">
              <div className="flex justify-between text-xs text-gray-500 mb-1">
                <span>Wins</span>
                <span>Losses</span>
              </div>
              <div className="h-3 rounded-full overflow-hidden flex bg-rcb-darker border border-white/5">
                <div className="h-full rounded-l-full transition-all duration-700" style={{ width: `${(wins / matches) * 100}%`, backgroundColor: '#4ade80' }} />
                <div className="h-full transition-all duration-700" style={{ width: `${(draws / matches) * 100}%`, backgroundColor: '#facc1580' }} />
                <div className="h-full rounded-r-full transition-all duration-700" style={{ width: `${(losses / matches) * 100}%`, backgroundColor: '#f87171' }} />
              </div>
            </div>
          )}
        </div>
      )
    }

    if (activeTab === 'h2h') {
      const matches = result.totalmatchesPlayed ?? result.TotalmatchesPlayed ?? 0
      const t1Wins = result.opponentWins ?? result.opponentwins ?? 0
      const t2Wins = result.rcbwins ?? result.rcbWins ?? 0
      const draws = result.totalDraws ?? result.totaldraws ?? 0
      const t1Color = getTeamColor(teamId)
      const t2Color = getTeamColor(team2Id)
      return (
        <div>
          {/* VS Header */}
          <div className="flex items-center justify-center gap-6 mb-8">
            <div className="flex flex-col items-center gap-2">
              <img src={getTeamLogo(teamId)} alt="" className="w-16 h-16 object-contain drop-shadow-lg" onError={(e) => e.target.style.display = 'none'} />
              <span className="text-sm font-bold" style={{ color: t1Color }}>{getTeamName(teamId)}</span>
            </div>
            <div className="flex flex-col items-center">
              <span className="text-3xl font-extrabold text-gray-600">VS</span>
              <span className="text-xs text-gray-500 mt-1">{matches} matches</span>
            </div>
            <div className="flex flex-col items-center gap-2">
              <img src={getTeamLogo(team2Id)} alt="" className="w-16 h-16 object-contain drop-shadow-lg" onError={(e) => e.target.style.display = 'none'} />
              <span className="text-sm font-bold" style={{ color: t2Color }}>{getTeamName(team2Id)}</span>
            </div>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <StatCard label="Total Matches" value={matches} icon={IconStadium} iconColor="#94a3b8" color="#94a3b8" />
            <StatCard label={`${getTeamName(teamId)} Wins`} value={t1Wins} icon={IconTrophy} iconColor={t1Color} color={t1Color} />
            <StatCard label={`${getTeamName(team2Id)} Wins`} value={t2Wins} icon={IconTrophy} iconColor={t2Color} color={t2Color} />
            <StatCard label="No Result" value={draws} icon={IconCloudRain} iconColor="#facc15" color="#facc15" />
          </div>

          <WinBar
            team1Name={getTeamName(teamId)}
            team2Name={getTeamName(team2Id)}
            team1Wins={t1Wins}
            team2Wins={t2Wins}
            team1Color={t1Color}
            team2Color={t2Color}
          />
        </div>
      )
    }

    if (activeTab === 'h2hseason' && Array.isArray(result)) {
      const t1Color = getTeamColor(teamId)
      const t2Color = getTeamColor(team2Id)
      return (
        <div>
          {/* VS Header */}
          <div className="flex items-center justify-center gap-6 mb-6">
            <div className="flex flex-col items-center gap-1">
              <img src={getTeamLogo(teamId)} alt="" className="w-12 h-12 object-contain drop-shadow-lg" onError={(e) => e.target.style.display = 'none'} />
              <span className="text-xs font-bold" style={{ color: t1Color }}>{getTeamName(teamId)}</span>
            </div>
            <div className="flex flex-col items-center">
              <span className="text-2xl font-extrabold text-gray-600">VS</span>
              <span className="text-xs text-gray-500">Season {season}</span>
            </div>
            <div className="flex flex-col items-center gap-1">
              <img src={getTeamLogo(team2Id)} alt="" className="w-12 h-12 object-contain drop-shadow-lg" onError={(e) => e.target.style.display = 'none'} />
              <span className="text-xs font-bold" style={{ color: t2Color }}>{getTeamName(team2Id)}</span>
            </div>
          </div>

          {result.length === 0 ? (
            <div className="text-center py-8">
              <div className="mb-3 flex justify-center opacity-40">
                <IconCricket color="#94a3b8" size={36} />
              </div>
              <p className="text-gray-500">No matches found for this combination.</p>
            </div>
          ) : (
            <div className="space-y-3">
              {result.map((match, i) => {
                const winnerIsTeam1 = match.winner?.name === getTeamName(teamId)
                const winnerColor = winnerIsTeam1 ? t1Color : t2Color
                return (
                  <div
                    key={i}
                    className="rounded-xl p-4 border border-white/5 hover:border-white/10 transition-all"
                    style={{ background: 'linear-gradient(135deg, #16213E, #1a1a2e)' }}
                  >
                    <div className="flex items-center justify-between mb-2">
                      <span className="text-xs text-gray-500 font-mono">{match.matchDate}</span>
                      <span
                        className="text-xs font-bold px-2 py-0.5 rounded-full"
                        style={{
                          backgroundColor: match.winner ? winnerColor + '20' : 'rgba(250,204,21,0.15)',
                          color: match.winner ? winnerColor : '#facc15',
                        }}
                      >
                        {match.winner ? `${match.winner.name} won` : 'No Result'}
                      </span>
                    </div>
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-2">
                        <span className="text-sm font-semibold" style={{ color: t1Color }}>{match.team1?.name || '-'}</span>
                        <span className="text-gray-600 text-xs">vs</span>
                        <span className="text-sm font-semibold" style={{ color: t2Color }}>{match.team2?.name || '-'}</span>
                      </div>
                    </div>
                    <p className="text-xs text-gray-600 mt-1 truncate flex items-center gap-1">
                      <IconMapPin color="#6b7280" size={12} />
                      {match.venue || 'Unknown venue'}
                    </p>
                  </div>
                )
              })}
            </div>
          )}
        </div>
      )
    }

    return null
  }

  return (
    <div className="max-w-5xl mx-auto px-4 py-10">
      {/* Page Header */}
      <div className="text-center mb-10">
        <h1 className="text-4xl md:text-5xl font-extrabold mb-2 tracking-tight">
          <span className="text-ipl-blue">IPL</span>{' '}
          <span className="bg-gradient-to-r from-ipl-orange to-yellow-400 bg-clip-text text-transparent">Statistics</span>
        </h1>
        <p className="text-gray-500 text-sm">Dive deep into IPL data across teams, seasons, and rivalries</p>
      </div>

      {/* Tabs */}
      <div className="flex flex-wrap gap-2 justify-center mb-8">
        {TABS.map((tab) => {
          const isActive = activeTab === tab.id
          return (
            <button
              key={tab.id}
              onClick={() => { setActiveTab(tab.id); setResult(null); setError('') }}
              className={`px-5 py-2.5 rounded-xl font-medium transition-all duration-300 cursor-pointer flex items-center gap-2 text-sm ${
                isActive
                  ? 'text-white shadow-lg'
                  : 'bg-rcb-card/50 text-gray-400 hover:text-white border border-white/5 hover:border-white/10'
              }`}
              style={isActive ? {
                background: `linear-gradient(135deg, ${primaryColor}, ${primaryColor}aa)`,
                boxShadow: `0 4px 20px ${primaryColor}40`,
              } : {}}
            >
              <tab.Icon color={isActive ? '#fff' : '#9ca3af'} size={16} />
              {tab.label}
            </button>
          )
        })}
      </div>

      {/* Controls */}
      <div
        className="rounded-2xl p-6 mb-8 border border-white/5"
        style={{ background: 'linear-gradient(135deg, #16213E, #1a1a2e)' }}
      >
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-5 mb-5">
          {(activeTab === 'team' || activeTab === 'season' || activeTab === 'h2h' || activeTab === 'h2hseason') && (
            <Select label="Team 1" value={teamId} onChange={setTeamId} options={teams} />
          )}
          {(activeTab === 'h2h' || activeTab === 'h2hseason') && (
            <Select label="Team 2" value={team2Id} onChange={setTeam2Id} options={teams} />
          )}
          {(activeTab === 'season' || activeTab === 'h2hseason') && (
            <Select
              label="Season"
              value={season}
              onChange={setSeason}
              options={seasons}
              valueKey="year"
              labelKey="year"
            />
          )}
        </div>
        <button
          onClick={() => handleFetch()}
          className="relative overflow-hidden text-white font-semibold px-8 py-3 rounded-xl transition-all duration-300 cursor-pointer hover:shadow-lg active:scale-95"
          style={{
            background: `linear-gradient(135deg, ${primaryColor}, ${primaryColor}aa)`,
            boxShadow: `0 2px 12px ${primaryColor}30`,
          }}
        >
          Get Stats
        </button>
      </div>

      {/* Results */}
      <div
        className="rounded-2xl p-6 border border-white/5 min-h-[200px]"
        style={{ background: 'linear-gradient(135deg, #16213E, #1a1a2e)' }}
      >
        {renderResult()}
      </div>
    </div>
  )
}

export default Stats

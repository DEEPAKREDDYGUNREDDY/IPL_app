import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { getTeams } from '../api/rcbApi'

const TEAM_INFO = {
  'RCB': { full: 'Royal Challengers Bengaluru', bg: '#E41E26', glow: '#E41E26', titles: ['2025'] },
  'MI': { full: 'Mumbai Indians', bg: '#004BA0', glow: '#1E90FF', titles: ['2013', '2015', '2017', '2019', '2020'] },
  'CSK': { full: 'Chennai Super Kings', bg: '#FFCB05', glow: '#FFCB05', titles: ['2010', '2011', '2018', '2021', '2023'] },
  'KKR': { full: 'Kolkata Knight Riders', bg: '#3A225D', glow: '#9B59B6', titles: ['2012', '2014', '2024'] },
  'SRH': { full: 'Sunrisers Hyderabad', bg: '#FF822A', glow: '#FF822A', titles: ['2016'] },
  'DC': { full: 'Delhi Capitals', bg: '#004C93', glow: '#4A90D9', titles: [] },
  'DD': { full: 'Delhi Daredevils', bg: '#004C93', glow: '#4A90D9', titles: [] },
  'RR': { full: 'Rajasthan Royals', bg: '#E73895', glow: '#E73895', titles: ['2008'] },
  'PBKS': { full: 'Punjab Kings', bg: '#ED1B24', glow: '#ED1B24', titles: [] },
  'KXIP': { full: 'Kings XI Punjab', bg: '#ED1B24', glow: '#ED1B24', titles: [] },
  'LSG': { full: 'Lucknow Super Giants', bg: '#A72056', glow: '#D63384', titles: [] },
  'GT': { full: 'Gujarat Titans', bg: '#1C1C2B', glow: '#B8860B', titles: ['2022'] },
  'DCG': { full: 'Deccan Chargers', bg: '#1C1C2B', glow: '#DAA520', titles: ['2009'] },
  'PW': { full: 'Pune Warriors India', bg: '#2F9BE3', glow: '#2F9BE3', titles: [] },
  'PWI': { full: 'Pune Warriors India', bg: '#2F9BE3', glow: '#2F9BE3', titles: [] },
  'RPS': { full: 'Rising Pune Supergiant', bg: '#6F42C1', glow: '#8B5CF6', titles: [] },
  'GL': { full: 'Gujarat Lions', bg: '#E04F16', glow: '#E04F16', titles: [] },
  'KTK': { full: 'Kochi Tuskers Kerala', bg: '#6B3FA0', glow: '#8B5CF6', titles: [] },
}

function getTeamInfo(name) {
  if (TEAM_INFO[name]) return { ...TEAM_INFO[name], short: name }
  const entry = Object.entries(TEAM_INFO).find(([, v]) => v.full === name)
  if (entry) return { ...entry[1], short: entry[0] }
  return { full: name, bg: '#555', glow: '#888', short: name.slice(0, 3).toUpperCase(), titles: [] }
}

function TeamCard({ team, index, navigate }) {
  const [visible, setVisible] = useState(false)
  const [hovered, setHovered] = useState(false)
  const info = getTeamInfo(team.name)
  const hasTitles = info.titles.length > 0

  // Use real PNG logos, fallback to SVG badge
  const logoPng = `/logos/${info.short.toLowerCase()}.png`
  const logoSvg = `/logos/${info.short.toLowerCase()}.svg`
  const [logoSrc, setLogoSrc] = useState(logoPng)

  useEffect(() => {
    const timer = setTimeout(() => setVisible(true), index * 120)
    return () => clearTimeout(timer)
  }, [index])

  return (
    <button
      onClick={() => navigate(`/stats?team=${team.id}`)}
      onMouseEnter={() => setHovered(true)}
      onMouseLeave={() => setHovered(false)}
      className={`group relative rounded-2xl p-5 flex flex-col items-center gap-4 cursor-pointer transition-all duration-700 ease-out overflow-hidden ${
        visible
          ? 'opacity-100 translate-y-0 scale-100'
          : 'opacity-0 translate-y-12 scale-75'
      }`}
      style={{
        background: hovered
          ? `linear-gradient(145deg, ${info.bg}22, ${info.bg}11, #16213E)`
          : '#16213E',
        border: `1px solid ${hovered ? info.glow + '60' : 'rgba(255,255,255,0.05)'}`,
        boxShadow: hovered
          ? `0 0 30px ${info.glow}30, 0 0 60px ${info.glow}15, 0 8px 32px rgba(0,0,0,0.4)`
          : '0 2px 8px rgba(0,0,0,0.2)',
        transform: visible
          ? hovered ? 'translateY(-8px) scale(1.05)' : 'translateY(0) scale(1)'
          : 'translateY(48px) scale(0.75)',
      }}
    >
      {/* Glow ring behind logo on hover */}
      <div
        className="absolute top-3 left-1/2 -translate-x-1/2 w-20 h-20 rounded-full transition-opacity duration-500 blur-xl"
        style={{
          backgroundColor: info.glow,
          opacity: hovered ? 0.4 : 0,
        }}
      />

      {/* Team Logo */}
      <div className="relative z-10">
        <img
          src={logoSrc}
          alt={info.full}
          className="w-20 h-20 object-contain drop-shadow-lg transition-transform duration-500"
          style={{
            transform: hovered ? 'scale(1.15) rotate(3deg)' : 'scale(1) rotate(0deg)',
            filter: `drop-shadow(0 4px 12px ${info.glow}40)`,
          }}
          onError={() => setLogoSrc(logoSvg)}
        />
      </div>

      {/* Team Name */}
      <span
        className="text-sm font-medium text-center leading-tight transition-colors duration-300 relative z-10"
        style={{ color: hovered ? info.glow : '#d1d5db' }}
      >
        {info.full}
      </span>

      {/* Trophy Overlay - slides up on hover for title-winning teams */}
      {hasTitles && (
        <div
          className="absolute inset-0 z-30 flex flex-col items-center justify-center rounded-2xl transition-all duration-500 ease-out px-3"
          style={{
            background: `linear-gradient(180deg, ${info.bg}ee 0%, ${info.bg}cc 50%, #0f0f1af0 100%)`,
            opacity: hovered ? 1 : 0,
            transform: hovered ? 'translateY(0)' : 'translateY(100%)',
            pointerEvents: hovered ? 'auto' : 'none',
          }}
        >
          {/* Team logo + name */}
          <img
            src={logoSrc}
            alt={info.short}
            className="w-8 h-8 object-contain drop-shadow-md"
          />
          <span className="text-white font-extrabold text-base tracking-wider mb-1">
            {info.short}
          </span>

          {/* Trophy */}
          <div className="text-3xl mb-1 animate-bounce" style={{ animationDuration: '2s' }}>
            🏆
          </div>

          {/* Winning Years */}
          <div className="flex flex-wrap items-center justify-center gap-x-1 gap-y-0 px-1">
            {info.titles.map((year, i) => (
              <span key={year} className="flex items-center">
                <span className="text-xs font-bold" style={{ color: '#FFD700' }}>
                  {year}
                </span>
                {i < info.titles.length - 1 && (
                  <span className="text-white/30 mx-0.5 text-xs">|</span>
                )}
              </span>
            ))}
          </div>
        </div>
      )}

      {/* Bottom accent line */}
      <div
        className="absolute bottom-0 left-1/2 -translate-x-1/2 h-[2px] rounded-full transition-all duration-500 z-40"
        style={{
          width: hovered ? '60%' : '0%',
          backgroundColor: hasTitles && hovered ? '#FFD700' : info.glow,
          boxShadow: `0 0 10px ${hasTitles && hovered ? '#FFD700' : info.glow}`,
        }}
      />
    </button>
  )
}

function Home() {
  const [teams, setTeams] = useState([])
  const [loading, setLoading] = useState(true)
  const navigate = useNavigate()

  useEffect(() => {
    getTeams()
      .then(setTeams)
      .catch(() => setTeams([]))
      .finally(() => setLoading(false))
  }, [])

  return (
    <div>
      {/* Hero Section */}
      <section className="relative overflow-hidden py-24 px-4 text-center">
        {/* Animated background */}
        <div className="absolute inset-0 bg-gradient-to-br from-ipl-blue/15 via-rcb-darker to-ipl-orange/10" />
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_top,_var(--color-ipl-blue)_0%,_transparent_50%)] opacity-10" />
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_bottom_right,_var(--color-ipl-orange)_0%,_transparent_50%)] opacity-10" />

        <div className="relative z-10 max-w-3xl mx-auto">
          {/* Real IPL Logo */}
          <img
            src="/ipl-logo.png"
            alt="IPL Logo"
            className="h-24 mx-auto mb-8 drop-shadow-lg"
            style={{ filter: 'drop-shadow(0 0 20px rgba(37, 99, 235, 0.3))' }}
          />

          <h1 className="text-5xl md:text-7xl font-extrabold mb-5 tracking-tight">
            <span className="text-ipl-blue">IPL</span>{' '}
            <span className="bg-gradient-to-r from-ipl-orange to-yellow-400 bg-clip-text text-transparent">
              Analytics
            </span>
          </h1>
          <p className="text-xl md:text-2xl text-gray-300 mb-3 font-light">
            Your Cricket Intelligence Hub
          </p>
          <p className="text-gray-500 max-w-lg mx-auto">
            Explore comprehensive IPL stats, head-to-head records, and season insights for every team.
          </p>
        </div>
      </section>

      {/* Teams Grid */}
      <section className="max-w-6xl mx-auto px-4 pb-20">
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold mb-3">
            Choose Your{' '}
            <span className="bg-gradient-to-r from-ipl-blue to-ipl-orange bg-clip-text text-transparent">
              Team
            </span>
          </h2>
          <p className="text-gray-500">Select a team to dive into their stats and performance</p>
        </div>

        {loading ? (
          <div className="text-center py-20">
            <div className="w-14 h-14 border-4 border-ipl-blue border-t-ipl-orange rounded-full animate-spin mx-auto" />
            <p className="text-gray-400 mt-6 text-lg">Loading teams...</p>
          </div>
        ) : (
          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-5">
            {teams.map((team, index) => (
              <TeamCard key={team.id} team={team} index={index} navigate={navigate} />
            ))}
          </div>
        )}
      </section>
    </div>
  )
}

export default Home

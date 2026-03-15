import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'

/* ── SVG Icons ── */
function IconTrophy({ color = 'currentColor', size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M6 9H3a1 1 0 01-1-1V5a1 1 0 011-1h3" /><path d="M18 9h3a1 1 0 001-1V5a1 1 0 00-1-1h-3" /><path d="M6 4h12v6a6 6 0 01-12 0V4z" /><path d="M10 16h4" /><path d="M12 16v4" /><path d="M8 20h8" />
    </svg>
  )
}
function IconTarget({ color = 'currentColor', size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <circle cx="12" cy="12" r="10" /><circle cx="12" cy="12" r="6" /><circle cx="12" cy="12" r="2" />
    </svg>
  )
}
function IconTrendingUp({ color = 'currentColor', size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <polyline points="23 6 13.5 15.5 8.5 10.5 1 18" /><polyline points="17 6 23 6 23 12" />
    </svg>
  )
}
function IconSwords({ color = 'currentColor', size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M5.2 19.8L2 22l1-3.2 12-12L17.2 9z" /><path d="M18.8 4.2L22 2l-1 3.2-12 12L6.8 15z" /><path d="M15 9l-6 6" />
    </svg>
  )
}
function IconCalendar({ color = 'currentColor', size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <rect x="3" y="4" width="18" height="18" rx="2" /><line x1="16" y1="2" x2="16" y2="6" /><line x1="8" y1="2" x2="8" y2="6" /><line x1="3" y1="10" x2="21" y2="10" />
    </svg>
  )
}
function IconDatabase({ color = 'currentColor', size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <ellipse cx="12" cy="5" rx="9" ry="3" /><path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3" /><path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5" />
    </svg>
  )
}
function IconCode({ color = 'currentColor', size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <polyline points="16 18 22 12 16 6" /><polyline points="8 6 2 12 8 18" />
    </svg>
  )
}
function IconZap({ color = 'currentColor', size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2" />
    </svg>
  )
}
function IconServer({ color = 'currentColor', size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <rect x="2" y="2" width="20" height="8" rx="2" /><rect x="2" y="14" width="20" height="8" rx="2" /><line x1="6" y1="6" x2="6.01" y2="6" /><line x1="6" y1="18" x2="6.01" y2="18" />
    </svg>
  )
}
function IconLayout({ color = 'currentColor', size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <rect x="3" y="3" width="18" height="18" rx="2" /><line x1="3" y1="9" x2="21" y2="9" /><line x1="9" y1="21" x2="9" y2="9" />
    </svg>
  )
}
function IconPalette({ color = 'currentColor', size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <circle cx="13.5" cy="6.5" r="2" /><circle cx="17.5" cy="10.5" r="2" /><circle cx="8.5" cy="7.5" r="2" /><circle cx="6.5" cy="12.5" r="2" />
      <path d="M12 2C6.5 2 2 6.5 2 12s4.5 10 10 10c.93 0 1.5-.67 1.5-1.5 0-.39-.15-.74-.39-1.04-.23-.29-.37-.65-.37-1.07 0-.83.67-1.5 1.5-1.5H16c3.31 0 6-2.69 6-6 0-5.17-4.49-9-10-9z" />
    </svg>
  )
}
function IconArrowRight({ color = 'currentColor', size = 20 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <line x1="5" y1="12" x2="19" y2="12" /><polyline points="12 5 19 12 12 19" />
    </svg>
  )
}

const IPL_MILESTONES = [
  { year: '2008', event: 'The Beginning', detail: 'Rajasthan Royals, led by Shane Warne, pulled off the impossible and won the inaugural season.' },
  { year: '2011', event: 'CSK Dynasty', detail: 'Chennai Super Kings won back-to-back titles under Dhoni, cementing their legacy as IPL royalty.' },
  { year: '2013', event: 'MI Era Begins', detail: 'Mumbai Indians clinched their first title, kickstarting the most dominant run in IPL history.' },
  { year: '2016', event: 'RCB\'s 973', detail: 'Virat Kohli smashed 973 runs in a single season, a record that still stands unchallenged.' },
  { year: '2020', event: 'UAE Chapter', detail: 'IPL moved to the UAE during the pandemic, proving cricket stops for nothing.' },
  { year: '2022', event: 'New Era', detail: 'Two new franchises, Gujarat Titans and Lucknow Super Giants, joined the tournament. GT won it all in their debut season.' },
  { year: '2025', event: 'RCB Finally!', detail: 'Royal Challengers Bengaluru ended years of heartbreak and lifted their maiden IPL trophy.' },
]

const FEATURES = [
  {
    Icon: IconTrendingUp,
    color: '#4ade80',
    title: 'Team Performance',
    desc: 'Deep-dive into overall win rates, matches played, and performance metrics for all 18 franchises across IPL history.',
  },
  {
    Icon: IconCalendar,
    color: '#60a5fa',
    title: 'Season Breakdown',
    desc: 'Analyze any team\'s season, from the 2008 inaugural to the latest edition. See how champions were built, one season at a time.',
  },
  {
    Icon: IconSwords,
    color: '#f87171',
    title: 'Head-to-Head Rivalries',
    desc: 'MI vs CSK. RCB vs KKR. RR vs DC. Settle the debate with real numbers and overall H2H records across all meetings.',
  },
  {
    Icon: IconTarget,
    color: '#facc15',
    title: 'H2H by Season',
    desc: 'Drill into specific seasons to see match-by-match results between rivals including venues, dates, winners, the whole story.',
  },
]

const TECH_STACK = [
  { name: 'Spring Boot 3', desc: 'RESTful API with JPA/Hibernate', Icon: IconServer, color: '#6DB33F' },
  { name: 'React 19', desc: 'Blazing-fast UI with Vite 6', Icon: IconLayout, color: '#61DAFB' },
  { name: 'Tailwind CSS 4', desc: 'Utility-first dark theme', Icon: IconPalette, color: '#38BDF8' },
  { name: 'PostgreSQL', desc: '1,100+ matches in relational DB', Icon: IconDatabase, color: '#336791' },
]

const NUMBER_STATS = [
  { value: '1,100+', label: 'Matches', color: '#F97316' },
  { value: '18', label: 'Franchises', color: '#2563EB' },
  { value: '18', label: 'Seasons', color: '#4ade80' },
  { value: '4', label: 'Stat Modes', color: '#facc15' },
]

function AnimatedCounter({ visible, index, children }) {
  const [show, setShow] = useState(false)
  useEffect(() => {
    if (visible) {
      const timer = setTimeout(() => setShow(true), index * 100)
      return () => clearTimeout(timer)
    }
  }, [visible, index])
  return (
    <div
      className={`transition-all duration-700 ease-out ${show ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-8'}`}
    >
      {children}
    </div>
  )
}

function About() {
  const [visible, setVisible] = useState(false)
  const navigate = useNavigate()

  useEffect(() => {
    const timer = setTimeout(() => setVisible(true), 100)
    return () => clearTimeout(timer)
  }, [])

  return (
    <div className="relative overflow-hidden">
      {/* Background decoration */}
      <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_top_left,_var(--color-ipl-blue)_0%,_transparent_40%)] opacity-[0.07]" />
      <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_bottom_right,_var(--color-ipl-orange)_0%,_transparent_40%)] opacity-[0.07]" />

      <div className="relative max-w-5xl mx-auto px-4 py-16">

        {/* ═══ Hero Section ═══ */}
        <div className={`text-center mb-20 transition-all duration-1000 ease-out ${visible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'}`}>
          <img
            src="/ipl-logo.png"
            alt="IPL"
            className="h-20 mx-auto mb-8 drop-shadow-lg"
            style={{ filter: 'drop-shadow(0 0 24px rgba(37, 99, 235, 0.25))' }}
          />
          <h1 className="text-4xl md:text-6xl font-extrabold mb-5 tracking-tight">
            About{' '}
            <span className="text-ipl-blue">IPL</span>{' '}
            <span className="bg-gradient-to-r from-ipl-orange to-yellow-400 bg-clip-text text-transparent">Analytics</span>
          </h1>
          <p className="text-gray-400 text-lg md:text-xl max-w-2xl mx-auto leading-relaxed">
            Built by cricket nerds, for cricket nerds. Every ball, every boundary, every
            nail-biting super over, all crunched into stats that tell the real story of the IPL.
          </p>
        </div>

        {/* ═══ Numbers Bar ═══ */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-20">
          {NUMBER_STATS.map((stat, i) => (
            <AnimatedCounter key={stat.label} visible={visible} index={i}>
              <div
                className="rounded-2xl p-6 text-center border border-white/5 hover:border-white/10 transition-all duration-300 group"
                style={{ background: 'linear-gradient(135deg, #16213E, #1a1a2e)' }}
              >
                <div
                  className="absolute top-0 right-0 w-16 h-16 rounded-full blur-3xl opacity-10 group-hover:opacity-25 transition-opacity"
                  style={{ backgroundColor: stat.color }}
                />
                <p className="text-3xl md:text-4xl font-extrabold mb-1" style={{ color: stat.color }}>{stat.value}</p>
                <p className="text-gray-500 text-xs uppercase tracking-widest font-medium">{stat.label}</p>
              </div>
            </AnimatedCounter>
          ))}
        </div>

        {/* ═══ What You Can Do ═══ */}
        <section className="mb-20">
          <div className="text-center mb-10">
            <h2 className="text-3xl md:text-4xl font-bold mb-3">
              What You Can{' '}
              <span className="bg-gradient-to-r from-ipl-blue to-ipl-orange bg-clip-text text-transparent">Explore</span>
            </h2>
            <p className="text-gray-500 text-sm max-w-lg mx-auto">Four powerful stat modes to settle every cricket debate</p>
          </div>
          <div className="grid md:grid-cols-2 gap-5">
            {FEATURES.map((f, i) => (
              <AnimatedCounter key={f.title} visible={visible} index={i + 2}>
                <div
                  className="rounded-2xl p-6 border border-white/5 hover:border-white/15 transition-all duration-300 group relative overflow-hidden"
                  style={{ background: 'linear-gradient(135deg, #16213E, #1a1a2e)' }}
                >
                  <div
                    className="absolute -top-4 -right-4 w-24 h-24 rounded-full blur-3xl opacity-0 group-hover:opacity-15 transition-opacity duration-500"
                    style={{ backgroundColor: f.color }}
                  />
                  <div className="flex items-start gap-4 relative z-10">
                    <div
                      className="w-11 h-11 rounded-xl flex items-center justify-center shrink-0 mt-0.5"
                      style={{ backgroundColor: f.color + '15', border: `1px solid ${f.color}30` }}
                    >
                      <f.Icon color={f.color} size={20} />
                    </div>
                    <div>
                      <h3 className="text-lg font-bold text-white mb-1.5 group-hover:text-white/90">{f.title}</h3>
                      <p className="text-gray-400 text-sm leading-relaxed">{f.desc}</p>
                    </div>
                  </div>
                </div>
              </AnimatedCounter>
            ))}
          </div>
        </section>

        {/* ═══ IPL Timeline ═══ */}
        <section className="mb-20">
          <div className="text-center mb-10">
            <h2 className="text-3xl md:text-4xl font-bold mb-3">
              IPL Through the{' '}
              <span className="bg-gradient-to-r from-yellow-400 to-ipl-orange bg-clip-text text-transparent">Years</span>
            </h2>
            <p className="text-gray-500 text-sm max-w-lg mx-auto">The moments that shaped the greatest cricket league on the planet</p>
          </div>

          <div className="relative">
            {/* Vertical line */}
            <div className="absolute left-6 md:left-1/2 top-0 bottom-0 w-px bg-gradient-to-b from-ipl-blue via-ipl-orange to-ipl-blue opacity-20" />

            <div className="space-y-8">
              {IPL_MILESTONES.map((m, i) => {
                const isLeft = i % 2 === 0
                return (
                  <AnimatedCounter key={m.year} visible={visible} index={i + 3}>
                    <div className={`relative flex items-start gap-4 md:gap-0 ${isLeft ? 'md:flex-row' : 'md:flex-row-reverse'}`}>
                      {/* Mobile: simple left-aligned layout */}
                      {/* Desktop: alternating sides */}
                      <div className={`hidden md:block md:w-1/2 ${isLeft ? 'md:pr-10 md:text-right' : 'md:pl-10 md:text-left'}`}>
                        <div
                          className="rounded-2xl p-5 border border-white/5 hover:border-white/10 transition-all duration-300 inline-block max-w-md"
                          style={{ background: 'linear-gradient(135deg, #16213E, #1a1a2e)' }}
                        >
                          <p className="text-ipl-orange font-extrabold text-sm tracking-wider mb-1">{m.event}</p>
                          <p className="text-gray-400 text-sm leading-relaxed">{m.detail}</p>
                        </div>
                      </div>

                      {/* Center dot */}
                      <div className="absolute left-6 md:left-1/2 -translate-x-1/2 w-3 h-3 rounded-full bg-ipl-blue border-2 border-rcb-darker z-10 mt-2" />

                      {/* Year badge */}
                      <div className={`hidden md:flex md:w-1/2 items-start ${isLeft ? 'md:pl-10' : 'md:pr-10 md:justify-end'}`}>
                        <span
                          className="text-2xl font-extrabold tracking-wider"
                          style={{
                            background: 'linear-gradient(135deg, #2563EB, #F97316)',
                            WebkitBackgroundClip: 'text',
                            WebkitTextFillColor: 'transparent',
                          }}
                        >
                          {m.year}
                        </span>
                      </div>

                      {/* Mobile layout */}
                      <div className="md:hidden pl-10">
                        <span
                          className="text-lg font-extrabold tracking-wider block mb-1"
                          style={{
                            background: 'linear-gradient(135deg, #2563EB, #F97316)',
                            WebkitBackgroundClip: 'text',
                            WebkitTextFillColor: 'transparent',
                          }}
                        >
                          {m.year}
                        </span>
                        <div
                          className="rounded-2xl p-4 border border-white/5"
                          style={{ background: 'linear-gradient(135deg, #16213E, #1a1a2e)' }}
                        >
                          <p className="text-ipl-orange font-extrabold text-sm mb-1">{m.event}</p>
                          <p className="text-gray-400 text-sm leading-relaxed">{m.detail}</p>
                        </div>
                      </div>
                    </div>
                  </AnimatedCounter>
                )
              })}
            </div>
          </div>
        </section>

        {/* ═══ Data Source ═══ */}
        <section className="mb-20">
          <div
            className="rounded-2xl p-8 md:p-10 border border-white/5 relative overflow-hidden"
            style={{ background: 'linear-gradient(135deg, #16213E, #1a1a2e)' }}
          >
            <div className="absolute -top-10 -right-10 w-40 h-40 rounded-full blur-3xl opacity-10 bg-ipl-orange" />
            <div className="absolute -bottom-10 -left-10 w-40 h-40 rounded-full blur-3xl opacity-10 bg-ipl-blue" />

            <div className="relative z-10 flex flex-col md:flex-row items-center gap-8">
              <div className="w-16 h-16 rounded-2xl bg-ipl-orange/10 border border-ipl-orange/20 flex items-center justify-center shrink-0">
                <IconDatabase color="#F97316" size={28} />
              </div>
              <div>
                <h3 className="text-2xl font-bold text-white mb-3">Powered by Real Match Data</h3>
                <p className="text-gray-400 leading-relaxed">
                  Every stat on this platform comes from a curated dataset of{' '}
                  <span className="text-ipl-orange font-bold">1,100+ IPL matches</span> spanning{' '}
                  <span className="text-ipl-blue font-bold">18 seasons</span> (2008-2025).
                  Match files are parsed, loaded into PostgreSQL, and served through a
                  Spring Boot REST API. No guesswork, just pure data.
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* ═══ Tech Stack ═══ */}
        <section className="mb-20">
          <div className="text-center mb-10">
            <h2 className="text-3xl md:text-4xl font-bold mb-3">
              Built{' '}
              <span className="bg-gradient-to-r from-ipl-blue to-ipl-orange bg-clip-text text-transparent">With</span>
            </h2>
            <p className="text-gray-500 text-sm">The tech stack powering every query</p>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {TECH_STACK.map((t, i) => (
              <AnimatedCounter key={t.name} visible={visible} index={i + 6}>
                <div
                  className="rounded-2xl p-5 border border-white/5 hover:border-white/10 transition-all duration-300 text-center group relative overflow-hidden"
                  style={{ background: 'linear-gradient(135deg, #16213E, #1a1a2e)' }}
                >
                  <div
                    className="absolute inset-0 opacity-0 group-hover:opacity-5 transition-opacity duration-500"
                    style={{ backgroundColor: t.color }}
                  />
                  <div
                    className="w-12 h-12 rounded-xl mx-auto mb-3 flex items-center justify-center"
                    style={{ backgroundColor: t.color + '15', border: `1px solid ${t.color}25` }}
                  >
                    <t.Icon color={t.color} size={22} />
                  </div>
                  <p className="font-bold text-white text-sm mb-1">{t.name}</p>
                  <p className="text-gray-500 text-xs">{t.desc}</p>
                </div>
              </AnimatedCounter>
            ))}
          </div>
        </section>

        {/* ═══ CTA ═══ */}
        <section className="text-center">
          <div
            className="rounded-2xl p-10 md:p-14 border border-white/5 relative overflow-hidden"
            style={{ background: 'linear-gradient(135deg, #16213E, #1a1a2e)' }}
          >
            <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,_var(--color-ipl-blue)_0%,_transparent_60%)] opacity-[0.06]" />
            <div className="relative z-10">
              <div className="w-14 h-14 rounded-2xl bg-gradient-to-br from-ipl-blue to-ipl-orange mx-auto mb-6 flex items-center justify-center shadow-lg shadow-ipl-blue/20">
                <IconZap color="#fff" size={24} />
              </div>
              <h3 className="text-2xl md:text-3xl font-extrabold text-white mb-3">Ready to Crunch Some Numbers?</h3>
              <p className="text-gray-400 mb-8 max-w-md mx-auto">
                Pick a team, pick a rival, pick a season. Let the data do the talking.
              </p>
              <button
                onClick={() => navigate('/stats')}
                className="inline-flex items-center gap-2 text-white font-semibold px-8 py-3.5 rounded-xl transition-all duration-300 cursor-pointer hover:shadow-lg hover:shadow-ipl-blue/25 active:scale-95 hover:gap-3"
                style={{ background: 'linear-gradient(135deg, #2563EB, #F97316)' }}
              >
                Explore Stats
                <IconArrowRight color="#fff" size={18} />
              </button>
            </div>
          </div>
        </section>

      </div>
    </div>
  )
}

export default About

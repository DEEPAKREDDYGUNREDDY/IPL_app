import { NavLink } from 'react-router-dom'

function Navbar() {
  const linkClass = ({ isActive }) =>
    `px-4 py-2 rounded-lg transition-colors font-medium ${
      isActive
        ? 'bg-rcb-red text-white'
        : 'text-gray-300 hover:text-rcb-gold hover:bg-white/5'
    }`

  return (
    <nav className="bg-rcb-dark/80 backdrop-blur-md border-b border-rcb-red/30 sticky top-0 z-50">
      <div className="max-w-6xl mx-auto px-4 py-3 flex items-center justify-between">
        <NavLink to="/" className="flex items-center gap-3 group">
          <img
            src="/ipl-logo.png"
            alt="IPL"
            className="h-9 group-hover:scale-110 transition-transform drop-shadow-md"
          />
          <span className="text-xl font-bold">
            <span className="text-ipl-blue">IPL</span>
            <span className="text-ipl-orange"> Analytics</span>
          </span>
        </NavLink>

        <div className="flex gap-2">
          <NavLink to="/" className={linkClass}>Home</NavLink>
          <NavLink to="/stats" className={linkClass}>Stats</NavLink>
          <NavLink to="/about" className={linkClass}>About</NavLink>
        </div>
      </div>
    </nav>
  )
}

export default Navbar

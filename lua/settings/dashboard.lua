local global = vim.g
local version = vim.version()
local title = string.format('nvim v%s.%s.%s', version['major'], version['minor'], version['patch'])

global.dashboard_disable_at_vimenter = 0
global.dashboard_disable_statusline = 1
global.dashboard_default_executive = 'telescope'
global.dashboard_custom_header = {
  'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
  '88888888888888888888888888888888888888888888888888888',
  '8888"""""""""""""""8888888888888888888888888888888888',
  '8888               8888888888888888888888888888888888',
  '8888  ' .. title .. '  8888888888888888888888888888888888',
  '8888               888888888888888888888888888888888"',
  '8888aaaaaaaaaaaaaaa888888888888888888888888888888888a',
  '88888888888888888888888888888888888888888888888888888',
  '88888888888888888888888888888888888888888888888888888',
  '88888888888888888888888888888888888888888888888888888',
  '88888888888888888888888":::::"88888888888888888888888',
  '888888888888888888888::;gPPRg;::888888888888888888888',
  "88888888888888888888::dP'   `Yb::88888888888888888888",
  '88888888888888888888::8)     (8::88888888888888888888',
  '88888888888888888888;:Yb     dP:;88( )888888888888888',
  '888888888888888888888;:"8ggg8":;888888888888888888888',
  '88888888888888888888888aa:::aa88888888888888888888888',
  '88888888888888888888888888888888888888888888888888888',
  '88888888888888888888888888888888888888888888888888888',
  '88888888888888888888888888"88888888888888888888888888',
  '8888888888888888888888888:::8888888888888888888888888',
  '8888888888888888888888888:::8888888888888888888888888',
  '8888888888888888888888888:::8888888888888888888888888',
  '8888888888888888888888888:::8888888888888888888888888',
  '8888888888888888888888888:::8888888888888888888888888',
  '88888888888888888888888888a88888888888888888888888888',
  '"""""""""""""""""""\' `"""""""""\' `"""""""""""""""""""',
}
global.dashboard_custom_section = {
  a = { description = { '洛 New File                  SPC f n' }, command = 'DashboardNewFile' },
  b = { description = { '  Recents                   SPC f o' }, command = 'Telescope oldfiles' },
  c = { description = { '  Find File                 SPC f f' }, command = 'Telescope find_files' },
  d = { description = { '  Find Word                 SPC f w' }, command = 'Telescope live_grep' },
}
global.dashboard_custom_footer = {
  '"Talk is cheap. Show me the code."',
  '          Linus Torvalds          ',
}

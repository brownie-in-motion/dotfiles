-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/daniel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/daniel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/daniel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/daniel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/daniel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["jupyter-ascending.vim"] = {
    config = { "\27LJ\2\n³\1\0\0\a\0\t\0\0185\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\1K\0\1\0\28<Plug>JupyterExecuteAll\r<space>X\25<Plug>JupyterExecute\r<space>x\6n\20nvim_set_keymap\bapi\bvim\1\0\1\vsilent\2\0" },
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/jupyter-ascending.vim",
    url = "https://github.com/brownie-in-motion/jupyter-ascending.vim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["move.vim"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/move.vim",
    url = "https://github.com/rvmelkonian/move.vim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["onedark.vim"] = {
    config = { "\27LJ\2\nê\3\0\0\4\0\v\0\0236\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\5\0'\2\6\0005\3\a\0B\0\3\0016\0\0\0009\0\1\0009\0\5\0'\2\6\0005\3\b\0B\0\3\0016\0\0\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0\24colorscheme onedark\bcmd\1\0\3\ngroup\rcolorset\fcommandrcall onedark#set_highlight(\"StatusLine\", { \"bg\": { \"gui\": \"#262626\", \"cterm\": \"NONE\", \"cterm16\": \"NONE\" } }) \fpattern\6*\1\0\3\ngroup\rcolorset\fcommandncall onedark#set_highlight(\"Normal\", { \"fg\": { \"gui\": \"#ABB2BF\", \"cterm\": \"NONE\", \"cterm16\": \"NONE\" } }) \fpattern\6*\16ColorScheme\24nvim_create_autocmd\1\0\1\nclear\2\rcolorset\24nvim_create_augroup\bapi\bvim\0" },
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/onedark.vim",
    url = "https://github.com/joshdick/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    config = { "\27LJ\2\nU\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\b \r \16surround_32\f\\( \r \\)\16surround_36\6g\bvim\0" },
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  vimtex = {
    config = { "\27LJ\2\n©\2\0\0\3\0\n\0\0156\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0005\2\b\0=\2\t\1=\1\6\0K\0\1\0\foptions\1\6\0\0\r-verbose\21-file-line-error\15-synctex=1\29-interaction=nonstopmode\18-shell-escape\1\0\1\15executable\flatexmk\28vimtex_compiler_latexmk\1\2\0\0 Writing or overwriting file#vimtex_quickfix_ignore_filters\fzathura\23vimtex_view_method\6g\bvim\0" },
    loaded = true,
    path = "/home/daniel/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
try_loadstring("\27LJ\2\n©\2\0\0\3\0\n\0\0156\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0005\2\b\0=\2\t\1=\1\6\0K\0\1\0\foptions\1\6\0\0\r-verbose\21-file-line-error\15-synctex=1\29-interaction=nonstopmode\18-shell-escape\1\0\1\15executable\flatexmk\28vimtex_compiler_latexmk\1\2\0\0 Writing or overwriting file#vimtex_quickfix_ignore_filters\fzathura\23vimtex_view_method\6g\bvim\0", "config", "vimtex")
time([[Config for vimtex]], false)
-- Config for: vim-surround
time([[Config for vim-surround]], true)
try_loadstring("\27LJ\2\nU\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\b \r \16surround_32\f\\( \r \\)\16surround_36\6g\bvim\0", "config", "vim-surround")
time([[Config for vim-surround]], false)
-- Config for: onedark.vim
time([[Config for onedark.vim]], true)
try_loadstring("\27LJ\2\nê\3\0\0\4\0\v\0\0236\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\5\0'\2\6\0005\3\a\0B\0\3\0016\0\0\0009\0\1\0009\0\5\0'\2\6\0005\3\b\0B\0\3\0016\0\0\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0\24colorscheme onedark\bcmd\1\0\3\ngroup\rcolorset\fcommandrcall onedark#set_highlight(\"StatusLine\", { \"bg\": { \"gui\": \"#262626\", \"cterm\": \"NONE\", \"cterm16\": \"NONE\" } }) \fpattern\6*\1\0\3\ngroup\rcolorset\fcommandncall onedark#set_highlight(\"Normal\", { \"fg\": { \"gui\": \"#ABB2BF\", \"cterm\": \"NONE\", \"cterm16\": \"NONE\" } }) \fpattern\6*\16ColorScheme\24nvim_create_autocmd\1\0\1\nclear\2\rcolorset\24nvim_create_augroup\bapi\bvim\0", "config", "onedark.vim")
time([[Config for onedark.vim]], false)
-- Config for: jupyter-ascending.vim
time([[Config for jupyter-ascending.vim]], true)
try_loadstring("\27LJ\2\n³\1\0\0\a\0\t\0\0185\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\1K\0\1\0\28<Plug>JupyterExecuteAll\r<space>X\25<Plug>JupyterExecute\r<space>x\6n\20nvim_set_keymap\bapi\bvim\1\0\1\vsilent\2\0", "config", "jupyter-ascending.vim")
time([[Config for jupyter-ascending.vim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

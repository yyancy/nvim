---Auto-wrap utility for text and markdown files
---
---Automatically formats paragraphs to fit within textwidth on file save.
---Supports text, markdown, and other text-like file types.
---Can be toggled on/off per buffer with M.toggle() and M.status().
---
---Configuration:
---  - Supported filetypes: text, markdown (extensible)
---  - Default: enabled for supported filetypes
---  - Toggle with: <leader>u88 (keymap)
---  - Check status: <leader>u89 (keymap)
---
---@module auto_wrap

local M = {}

local group = vim.api.nvim_create_augroup("AutoWrap", { clear = true })

-- Supported file types for auto-wrap (can be extended)
local allowed_ft = {
  text = true,
  markdown = true,
}

---Add a filetype to auto-wrap support
---@param ft string file type to add
function M.add_filetype(ft)
  allowed_ft[ft] = true
end

---Remove a filetype from auto-wrap support
---@param ft string file type to remove
function M.remove_filetype(ft)
  allowed_ft[ft] = nil
end

---Check if auto-wrap is supported for the given buffer
---@param bufnr integer|nil buffer number (0 for current)
---@return boolean
local function is_supported(bufnr)
  bufnr = bufnr or 0
  return allowed_ft[vim.bo[bufnr].filetype] == true
end

---Check if auto-wrap is enabled for the given buffer
---@param bufnr integer|nil buffer number (0 for current)
---@return boolean
local function is_enabled(bufnr)
  bufnr = bufnr or 0

  if not is_supported(bufnr) then
    return false
  end

  if vim.b[bufnr].auto_wrap_enabled == nil then
    return true
  end

  return vim.b[bufnr].auto_wrap_enabled
end

---Format the last changed region to fit within textwidth
local function format_current_paragraph()
  local view = vim.fn.winsaveview()

  -- Format from last change to cursor position, preserving indentation
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false)
  vim.cmd([[silent! keepjumps normal! g`[gw`]])

  vim.fn.winrestview(view)
end

vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  callback = function(args)
    if not is_enabled(args.buf) then
      return
    end

    format_current_paragraph()
  end,
  desc = "Auto-wrap text on save",
})

---Enable auto-wrap for the current buffer
function M.enable()
  if not is_supported() then
    vim.notify("AutoWrap only supports: " .. table.concat(vim.tbl_keys(allowed_ft), ", "), vim.log.levels.WARN)
    return
  end

  vim.b.auto_wrap_enabled = true
  vim.notify("AutoWrap enabled (tw=" .. vim.bo.textwidth .. ")", vim.log.levels.INFO)
end

---Disable auto-wrap for the current buffer
function M.disable()
  vim.b.auto_wrap_enabled = false
  vim.notify("AutoWrap disabled", vim.log.levels.INFO)
end

---Toggle auto-wrap for the current buffer
function M.toggle()
  if not is_supported() then
    return
  end

  vim.b.auto_wrap_enabled = not is_enabled()

  vim.notify("AutoWrap " .. (vim.b.auto_wrap_enabled and "enabled" or "disabled"), vim.log.levels.INFO)
end

---Get the status of auto-wrap for the current buffer
---@return string "ON" or "OFF"
function M.status()
  return is_enabled() and "ON" or "OFF"
end

---Get list of supported filetypes
---@return table list of supported filetype names
function M.get_supported_filetypes()
  return vim.tbl_keys(allowed_ft)
end

return M



---Auto-wrap utility for text and markdown files
---
---Automatically formats paragraphs to fit within textwidth on file save.
---Supports text, markdown, and other text-like file types.
---Can be toggled on/off per buffer with M.toggle() and M.status().
---
---@module auto_wrap

local M = {}

local group = vim.api.nvim_create_augroup("AutoWrap", { clear = true })

local allowed_ft = {
  text = true,
  markdown = true,
}

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
})

---Enable auto-wrap for the current buffer
function M.enable()
  if not is_supported() then
    vim.notify("AutoWrap only supports text/markdown", vim.log.levels.WARN)
    return
  end

  vim.b.auto_wrap_enabled = true
  vim.notify("AutoWrap enabled")
end

---Disable auto-wrap for the current buffer
function M.disable()
  vim.b.auto_wrap_enabled = false
  vim.notify("AutoWrap disabled")
end

---Toggle auto-wrap for the current buffer
function M.toggle()
  if not is_supported() then
    return
  end

  vim.b.auto_wrap_enabled = not is_enabled()

  vim.notify("AutoWrap " .. (vim.b.auto_wrap_enabled and "enabled" or "disabled"))
end

---Get the status of auto-wrap for the current buffer
---@return string "ON" or "OFF"
function M.status()
  return is_enabled() and "ON" or "OFF"
end

return M


-- lua/utils/auto_wrap.lua

local M = {}

local group = vim.api.nvim_create_augroup("AutoWrap", { clear = true })

local allowed_ft = {
  text = true,
  markdown = true,
}

local function is_supported(bufnr)
  bufnr = bufnr or 0
  return allowed_ft[vim.bo[bufnr].filetype] == true
end

local function is_enabled(bufnr)
  bufnr = bufnr or 0

  -- 非支持文件类型永远关闭
  if not is_supported(bufnr) then
    return false
  end

  -- 默认开启
  if vim.b[bufnr].auto_wrap_enabled == nil then
    return true
  end

  return vim.b[bufnr].auto_wrap_enabled
end

local function format_current_paragraph()
  local view = vim.fn.winsaveview()

  -- vim.cmd("silent! normal! gwap")
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

function M.enable()
  if not is_supported() then
    vim.notify("AutoWrap only supports text/markdown", vim.log.levels.WARN)
    return
  end

  vim.b.auto_wrap_enabled = true
  vim.notify("AutoWrap enabled")
end

function M.disable()
  vim.b.auto_wrap_enabled = false
  vim.notify("AutoWrap disabled")
end

function M.toggle()
  if not is_supported() then
    return
  end

  vim.b.auto_wrap_enabled = not is_enabled()

  vim.notify("AutoWrap " .. (vim.b.auto_wrap_enabled and "enabled" or "disabled"))
end

function M.status()
  return is_enabled() and "ON" or "OFF"
end

return M

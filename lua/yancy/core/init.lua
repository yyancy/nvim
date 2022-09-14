local global = require('yancy.core.global')
print('has running in vscode?' .. tostring(global.is_vscode))

function bootstrap()
  local pack = require("yancy.core.pack")
  -- load plugins
  pack.ensure_plugins()
  pack.load_compile()
end


bootstrap()

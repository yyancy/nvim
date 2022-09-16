local global = require('yancy.core.global')

function bootstrap()
  local pack = require("yancy.core.pack")
  -- load plugins
  pack.ensure_plugins()
  pack.load_compile()
end


bootstrap()

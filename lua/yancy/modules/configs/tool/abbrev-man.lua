return function ()
	require("abbrev-man").setup({
		load_natural_dictionaries_at_startup = true,
		load_programming_dictionaries_at_startup = true,
		natural_dictionaries = {
			["nt_en"] = {
				["adn"] = "and",
				["THe"] = "The",
				["local"] = "127.0.0.1",
			},
			["nt_my_slangs"] = {
				["lmao"] = "LMAO",
			},
		},
		programming_dictionaries = {
			["pr_py"] = {
				["tset"] = "test",
				["ccccd"] = "127.0.0.1",
        ['true'] = "True",
        ['false'] = "False",
			},
		},
	})
  -- require('abbrev-man.main').main(0, 'load_natural_dictionaries_at_startup')
  -- require('abbrev-man.main').main(0, 'load_programming_dictionaries_at_startup')
end


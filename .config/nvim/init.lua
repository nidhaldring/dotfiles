-- please note lazy should load first, then the rest of the configs
-- because lazy has some weird behavior and FileType registration won't work correctly or something
require("config.lazy")
require("settings")
require("mappings")

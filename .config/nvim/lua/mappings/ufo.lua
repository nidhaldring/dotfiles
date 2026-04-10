local map = require("mappings.utils").map

-- folding
map("n", "zR", function()
  require("ufo").openAllFolds()
end)
map("n", "zM", function()
  require("ufo").closeAllFolds()
end)

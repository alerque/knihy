SILE.require("packages/image")

SILE.call("language", { main = "pl" })
SILE.call("set", { parameter = "document.parindent", value = "0pt" })

SILE.call("font", { language = "pl", family = "Iwona", size = "12pt" })

SILE.registerCommand("book:chapterfont", function (options, content)
  SILE.call("font", { family = "Antykwa Torunska", size = "22pt" }, content)
end)

SILE.registerCommand("book:sectionfont", function (options, content)
  SILE.call("font", { family = "Antykwa Torunska", size = "18pt" }, content)
end)

local original_chapter = SILE.Commands["chapter"]
SILE.registerCommand("chapter", function (options, content)
  options.numbering = false
  original_chapter(options, content)
end, "Begin a new chapter")

local original_section = SILE.Commands["section"]
SILE.registerCommand("section", function (options, content)
  options.numbering = false
  SILE.call("supereject")
  original_section(options, content)
end, "Begin a new section")

SILE.registerCommand("rule", function () end)
SILE.registerCommand("href", function (options, content)
  SILE.process(content)
end)

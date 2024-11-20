require('luasnip.session.snippet_colletion').clear_snippet 'cs'

local luasnip = require 'luasnip'

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets('cs', {
  s('hi', {
    t 'hello, world',
  }),
})

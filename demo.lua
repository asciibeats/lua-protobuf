local protobuf = require('protobuf')

local function dump(t, i)
  if not i then
    i = 0
  end
  for k, v in pairs(t) do
    local f = string.rep('  ', i) .. k .. ': '
    if type(v) == 'table' then
      print(f)
      dump(v, i + 1)
    elseif type(v) == 'boolean' then
      print(f .. tostring(v))
    else
      print(f .. v)
    end
  end
end

local input = {items = {[2] = 4.5}, nested = {text = 'hello!', some = {1, 2, 3}}, istrue = false}
local binary = protobuf.encode('demo.Base', input)
local output = protobuf.decode('demo.Base', binary)

print('INPUT')
dump(input)
print('OUTPUT')
dump(output)

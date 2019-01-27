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

local protobuf = require('protobuf')
local input = {items = {[1] = 2}, nested = {text = 'hello!', some = {1, 2, 3}}, istrue = false}
local binary = protobuf.encode('demo.Base', input)
local output = protobuf.decode('demo.Base', binary)

print('ENCODE')
dump(input)
print('\nDECODE')
dump(output)

local protobuf = require('protobuf')

local function contains(t1, t2)
  for k, v in pairs(t1) do
    if type(v) == 'table' then
      if type(t2[k]) == 'table' then
        if not contains(v, t2[k]) then
          return false
        end
      else
        return false
      end
    elseif v ~= t2[k] then
      return false
    end
  end
  return true
end

local input = {
  dbl = 3.0,
  rdbl = {3.0, 5.0},
  mdbl = {[42] = 3.0},
  flt = 3.0,
  rflt = {3.0, 5.0},
  mflt = {[42] = 3.0},
  int = -2147483648,
  rint = {2147483647, -2147483648},
  mint = {[2147483647] = -2147483648},
  sint = 2147483647,
  rsint = {2147483647, -2147483648},
  msint = {[2147483647] = -2147483648},
  sfint = 0,
  rsfint = {2147483647, -2147483648},
  msfint = {[2147483647] = -2147483648},
  long = -9223372036854775808,
  rlong = {9223372036854775807, -9223372036854775808},
  mlong = {[9223372036854775807] = -9223372036854775808},
  slong = 9223372036854775807,
  rslong = {9223372036854775807, -9223372036854775808},
  mslong = {[9223372036854775807] = -9223372036854775808},
  sflong = 0,
  rsflong = {9223372036854775807, -9223372036854775808},
  msflong = {[9223372036854775807] = -9223372036854775808},
  uint = 4294967295,
  ruint = {0, 4294967295},
  muint = {[0] = 4294967295},
  ufint = 0,
  rufint = {0, 4294967295},
  mufint = {[0] = 4294967295},
  ulong = 9223372036854775807,
  rulong = {0, 9223372036854775807},
  mulong = {[0] = 9223372036854775807},
  uflong = 0,
  ruflong = {0, 9223372036854775807},
  muflong = {[0] = 9223372036854775807},
  str = 'a',
  rstr = {'a', 'b'},
  mstr = {['a'] = 'b'},
  bin = 'x',
  rbin = {'x', 'y'},
  mbin = {[1] = 'y'},
  enm = 'B',
  renm = {'A', 'C', 'B'},
  menm = {[3] = 'C', [4] = 'B', [5] = 'A'},
  --enm = 1,
  --renm = {0, 2, 1},
  --menm = {[3] = 2, [4] = 1, [5] = 0},
  nst = {val = 42},
  rnst = {{val = 42}, {val = 43}},
  mnst = {[5] = {val = 42}, [7] = {val = 43}}
}

local binary = protobuf.encode('test.Test', input)
local output = protobuf.decode('test.Test', binary)

print(contains(input, output) and contains(output, input) and 'SUCCESS' or 'FAILURE')

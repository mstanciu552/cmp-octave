local ok, cmp = pcall(require, "cmp")

if ok then
	cmp.register_source("cmp_octave", require("cmp-octave").new())
end

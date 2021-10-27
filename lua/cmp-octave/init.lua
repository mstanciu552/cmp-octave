local source = {}

---Source constructor.
source.new = function()
	local self = setmetatable({}, { __index = source })
	self.your_awesome_variable = 1
	return self
end

---Return the source is available or not.
---@return boolean
function source:is_available()
	local file_extension = vim.bo.filetype
	return file_extension == "matlab"
end
---Return the source name for some information.
function source:get_debug_name()
	return "cmp_octave"
end

function source:complete(params, callback)
	callback(require("cmp-octave.source"))
end

---Resolve completion item that will be called when the item selected or before the item confirmation.
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:resolve(completion_item, callback)
	callback(completion_item)
end

---Execute command that will be called when after the item confirmation.
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:execute(completion_item, callback)
	callback(completion_item)
end

require("cmp").register_source("cmp_octave", source.new())

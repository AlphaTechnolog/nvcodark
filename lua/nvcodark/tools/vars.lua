local M = {}

function M.load (scope, varname, varval)
   vim[scope][varname] = varval
end

function M.single_scope_multiple (scope, vars)
   for key, val in pairs(vars) do
      M.load(scope, key, val)
   end
end

function M.load_table (vars)
   for scope, cnf in pairs(vars) do
      for key, val in pairs(cnf) do
         M.load(scope, key, val)
      end
   end
end

return M

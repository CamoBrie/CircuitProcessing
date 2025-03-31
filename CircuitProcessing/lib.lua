local lib = {}

lib.ingredient_exists_add = function(ingredient, rest)
  if ingredient and ingredient.type == "item" then
    if data.raw.item[ingredient.name] then
      local newtable = table.deepcopy(rest)
      table.insert(newtable, ingredient)
      return newtable
    end
  end
  if ingredient and ingredient.type == "fluid" then
    if data.raw.fluid[ingredient.name] then
      local newtable = table.deepcopy(rest)
      table.insert(newtable, ingredient)
      return newtable
    end
  end
  return rest
end

lib.hide_item = function(name)
  -- Add hidden flag to disabled items so they don't show up in circuit menu/item filter/FNEI etc.
  if data.raw.item[name] then
    data.raw.item[name].hidden = true
  end
  if data.raw.fluid[name] then
    data.raw.fluid[name].hidden = true
  end
  if data.raw.tool[name] then
    data.raw.tool[name].hidden = true
  end
end

lib.set_energy_required = function(recipe, energy)
  local r = data.raw.recipe[recipe]
  if type(recipe) == "string" and type(energy) == "number" and r then
      r.energy_required = energy
  else
    log(debug.traceback())
  end
end

lib.set_recipe_result = function(recipe, item)
  local r = data.raw.recipe[recipe]
  if type(recipe) == "string" and type(item) == "table" and r then
      r.results = { item }
  else
    log(debug.traceback())
  end
end

lib.set_main_product = function(recipe, item)
  local r = data.raw.recipe[recipe]
  if type(recipe) == "string" and type(item) == "string" and r then
      r.main_product = item
  else
    log(debug.traceback())
  end
end

lib.hide_recipe = function(recipe)
  local r = data.raw.recipe[recipe]
  if type(recipe) == "string" and r then
    r.hidden = true
    r.enabled = false
  else
    log(debug.traceback())
  end
end

return lib

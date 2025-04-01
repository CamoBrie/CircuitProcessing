local lib = require "lib"

if mods['angelsindustries'] then
  data:extend({
      {
        type = 'item-subgroup',
        name = 'sb-circuit-board',
        group = 'angels-components',
        order = 'b[electronics]-cc[sb-circuit-boards]'
      }
  })
else
  data:extend({
      {
        type = 'item-subgroup',
        name = 'sb-circuit-board',
        group = 'intermediate-products',
        order = 'e-a4'
      }
  })
end
local cpelectroniccircuitboard = data.raw.item['electronic-circuit']
data.raw.item['cp-electronic-circuit-board'] = cpelectroniccircuitboard
cpelectroniccircuitboard.name = 'cp-electronic-circuit-board'
data.raw.item['electronic-circuit'] =
  {
    type = "item",
    name = "electronic-circuit",
    icon = "__base__/graphics/icons/electronic-circuit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "sb-circuit-board",
    order = "e[electronic-circuit]",
    stack_size = 200
  }

local cpelectroniccircuitboardrecipe = data.raw.recipe['electronic-circuit']
data.raw.recipe['cp-electronic-circuit-board'] = cpelectroniccircuitboardrecipe
cpelectroniccircuitboardrecipe.name = 'cp-electronic-circuit-board'
lib.set_recipe_result('cp-electronic-circuit-board', {type = 'item', name = 'cp-electronic-circuit-board', amount = 1})
lib.set_main_product('cp-electronic-circuit-board', 'cp-electronic-circuit-board')
data.raw.recipe['electronic-circuit'] =
  {
    type = "recipe",
    name = "electronic-circuit",
    category = "bob-electronics",
    ingredients =
    {
      {type="item", name="cp-electronic-circuit-board", amount=1},
      {type="item", name="iron-plate", amount=2}
    },
    results = {{type="item", name="electronic-circuit", amount=1}},
    requester_paste_multiplier = 50,
    enabled = false,
    allow_decomposition = false
  }

local cpadvancedcircuitboard = data.raw.item['advanced-circuit']
data.raw.item['cp-advanced-circuit-board'] = cpadvancedcircuitboard
cpadvancedcircuitboard.name = 'cp-advanced-circuit-board'
data.raw.item['advanced-circuit'] =
  {
    type = "item",
    name = "advanced-circuit",
    icon = "__base__/graphics/icons/advanced-circuit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "sb-circuit-board",
    order = "f[advanced-circuit]",
    stack_size = 200
  }

local cpadvancedcircuitboardrecipe = data.raw.recipe['advanced-circuit']
data.raw.recipe['cp-advanced-circuit-board'] = cpadvancedcircuitboardrecipe
cpadvancedcircuitboardrecipe.name = 'cp-advanced-circuit-board'
lib.set_recipe_result('cp-advanced-circuit-board', {type = 'item', name = 'cp-advanced-circuit-board', amount = 1})
lib.set_main_product('cp-advanced-circuit-board', 'cp-advanced-circuit-board')

data.raw.recipe['advanced-circuit'] =
  {
    type = "recipe",
    name = "advanced-circuit",
    category = "bob-electronics",
    enabled = false,
    energy_required = 6,
    ingredients = lib.ingredient_exists_add(
      {type="item", name="aluminium-plate", amount=4},
    {
      {type="item", name="electronic-circuit", amount=2},
      {type="item", name="cp-advanced-circuit-board", amount=2},
      {type="item", name="copper-cable", amount=4}
    }),
    results = {{type="item", name="advanced-circuit", amount=1}},
    requester_paste_multiplier = 5,
    allow_decomposition = false
  }

local cpprocessingboard = data.raw.item['processing-unit']
data.raw.item['cp-processing-board'] = cpprocessingboard
cpprocessingboard.name = 'cp-processing-board'
data.raw.item['processing-unit'] =
  {
    type = "item",
    name = "processing-unit",
    icon = "__base__/graphics/icons/processing-unit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "sb-circuit-board",
    order = "g[processing-unit]",
    stack_size = 200
  }

local cpprocessingboardrecipe = data.raw.recipe['processing-unit']
data.raw.recipe['cp-processing-board'] = cpprocessingboardrecipe
cpprocessingboardrecipe.name = 'cp-processing-board'
lib.set_recipe_result('cp-processing-board', {type = 'item', name = 'cp-processing-board', amount = 1})
lib.set_main_product('cp-processing-board', 'cp-processing-board')
data.raw.recipe['processing-unit'] =
  {
    type = "recipe",
    name = "processing-unit",
    category = "bob-electronics-machine",
    enabled = false,
    energy_required = 10,
    ingredients = lib.ingredient_exists_add(
      {type="item", name="titanium-plate", amount=8},
    {
      {type="item", name="advanced-circuit", amount=4},
      {type="item", name="cp-processing-board", amount=4},
      {type = "fluid", name = "sulfuric-acid", amount = 5}
    }),
    results = {{type="item", name="processing-unit", amount=1}},
    allow_decomposition = false
  }
lib.set_energy_required('cp-processing-board', 5)
lib.set_energy_required('bob-superior-circuit-board', 5)

local cpadvancedprocessingboard = data.raw.item['bob-advanced-processing-unit']
data.raw.item['cp-advanced-processing-board'] = cpadvancedprocessingboard
cpadvancedprocessingboard.name = 'cp-advanced-processing-board'
data.raw.item['bob-advanced-processing-unit'] =
  {
    type = "item",
    name = "bob-advanced-processing-unit",
    icon = "__CircuitProcessing__/graphics/icons/advanced-processing-unit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "sb-circuit-board",
    order = "g[processing-unit]b",
    stack_size = 200
  }

local advancedplate = "steel-plate"
if data.raw.item["angels-plate-chrome"] then
  advancedplate = "angels-plate-chrome"
elseif data.raw.item["gold-plate"] then
  advancedplate = "gold-plate"
end
local advancedacid = "sulfuric-acid"
if data.raw.fluid["nitric-acid"] then
  advancedacid = "nitric-acid"
end

local cpadvancedprocessingboardrecipe = data.raw.recipe['bob-advanced-processing-unit']
data.raw.recipe['cp-advanced-processing-board'] = cpadvancedprocessingboardrecipe
cpadvancedprocessingboardrecipe.name = 'cp-advanced-processing-board'
lib.set_recipe_result('cp-advanced-processing-board', {type = 'item', name = 'cp-advanced-processing-board', amount = 1})
lib.set_main_product('cp-advanced-processing-board', 'cp-advanced-processing-board')
lib.set_energy_required('cp-advanced-processing-board', 5)
lib.set_energy_required('bob-multi-layer-circuit-board', 5)
data.raw.recipe['bob-advanced-processing-unit'] =
  {
    type = "recipe",
    name = "bob-advanced-processing-unit",
    category = "bob-electronics-machine",
    enabled = false,
    energy_required = 15,
    ingredients = lib.ingredient_exists_add(
      {advancedplate, 10},
    {
      {type="item", name="processing-unit", amount=3},
      {type="item", name="electronic-circuit", amount=20},
      {type="item", name="cp-advanced-processing-board", amount=9},
      {type = "fluid", name = advancedacid, amount = 5}
    }),
    results = {{type="item", name="bob-advanced-processing-unit", amount=1}},
    allow_decomposition = false
  }

local cable = {
  ['copper-cable']=true,
  ['tinned-copper-cable']=true,
  ['angels-wire-silver']=true,
  ['gilded-copper-cable']=true
}

local components = {
  'basic-electronic-components',
  'electronic-components',
  'intergrated-electronics'
}

local function doublecable(ingredients)
  for k,v in pairs(ingredients) do
    local idx = ""
    local amt = ""
    if v.name then
      idx = 'name'
      amt = 'amount'
    end
    if cable[v[idx]] then
      v[amt] = v[amt] * 2
    end
  end
end

for _,v in pairs(components) do
  if data.raw.recipe[v] then
    doublecable(data.raw.recipe[v].ingredients)
  end
end

data.raw.recipe['bob-basic-electronic-components'].results[1].amount = 10
lib.set_energy_required('bob-basic-electronic-components', 4)

-- bobmods.lib.module.add_productivity_limitations(circuits)

for k,v in pairs(data.raw.technology) do
  for ek,ev in pairs(v.effects or {}) do
    if ev.type == 'unlock-recipe' and ev.recipe == 'electronic-circuit' then
      table.insert(v.effects, ek, {type = 'unlock-recipe', recipe = 'cp-electronic-circuit-board'})
      break
    elseif ev.type == 'unlock-recipe' and ev.recipe == 'advanced-circuit' then
      table.insert(v.effects, ek, {type = 'unlock-recipe', recipe = 'cp-advanced-circuit-board'})
      if data.raw.technology['angels-aluminium-smelting-1'] then
        bobmods.lib.tech.add_prerequisite(k, 'angels-aluminium-smelting-1')
      end
      break
    elseif ev.type == 'unlock-recipe' and ev.recipe == 'processing-unit' then
      table.insert(v.effects, ek, {type = 'unlock-recipe', recipe = 'cp-processing-board'})
      if data.raw.technology['angels-titanium-smelting-1'] then
        bobmods.lib.tech.add_prerequisite(k, 'angels-titanium-smelting-1')
      end
      break
    elseif ev.type == 'unlock-recipe' and ev.recipe == 'bob-advanced-processing-unit' then
      table.insert(v.effects, ek, {type = 'unlock-recipe', recipe = 'cp-advanced-processing-board'})
      if data.raw.technology['angels-chrome-smelting-1'] then
        bobmods.lib.tech.add_prerequisite(k, 'angels-chrome-smelting-1')
      end
      break
    end
  end
end

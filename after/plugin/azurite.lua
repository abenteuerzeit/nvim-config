-- Installation
--
-- 1. Add azurite to plugins
-- abenteuerzeit/packer.lua
-- use("Azure/azurite")
--
-- 2. Copy git repository
-- :so
-- :PackerSync
--
-- 3. Go to the install path from packer-compiled.lua
-- Example: C:\Users\<YourUsername>\.config\nvim\lua\abenteuerzeit\packer.lua
--
-- 4. Run the install commands
-- npm ci
-- npm run build
-- npm install -g

local config = {
  blobHost = "127.0.0.1",
  blobPort = 10000,
  queueHost = "127.0.0.1",
  queuePort = 10001,
  tableHost = "127.0.0.1",
  tablePort = 10002,
  location = vim.fn.stdpath("data") .. "/azurite",
  silent = false,
  debug = false,
  loose = false,
  cert = nil,
  key = nil,
  pwd = nil,
  oauth = nil,
  skipApiVersionCheck = false,
  disableProductStyleUrl = false,
  inMemoryPersistence = false,
  extentMemoryLimit = nil,
}

local azurite_jobs = {}

local function start_azurite(service)
  local azurite_cmd = "azurite"

  if service == "blob" then
    azurite_cmd = azurite_cmd .. " --blobHost " .. config.blobHost .. " --blobPort " .. config.blobPort
  elseif service == "queue" then
    azurite_cmd = azurite_cmd .. " --queueHost " .. config.queueHost .. " --queuePort " .. config.queuePort
  elseif service == "table" then
    azurite_cmd = azurite_cmd .. " --tableHost " .. config.tableHost .. " --tablePort " .. config.tablePort
  end

  if config.location then
    azurite_cmd = azurite_cmd .. " --location " .. config.location
  end

  if config.silent then
    azurite_cmd = azurite_cmd .. " --silent"
  end

  if config.debug then
    azurite_cmd = azurite_cmd .. " --debug " .. config.location .. "/debug.log"
  end

  if config.loose then
    azurite_cmd = azurite_cmd .. " --loose"
  end

  if config.cert then
    azurite_cmd = azurite_cmd .. " --cert " .. config.cert
    if config.key then
      azurite_cmd = azurite_cmd .. " --key " .. config.key
    elseif config.pwd then
      azurite_cmd = azurite_cmd .. " --pwd " .. config.pwd
    end
  end

  if config.oauth then
    azurite_cmd = azurite_cmd .. " --oauth " .. config.oauth
  end

  if config.skipApiVersionCheck then
    azurite_cmd = azurite_cmd .. " --skipApiVersionCheck"
  end

  if config.disableProductStyleUrl then
    azurite_cmd = azurite_cmd .. " --disableProductStyleUrl"
  end

  if config.inMemoryPersistence then
    azurite_cmd = azurite_cmd .. " --inMemoryPersistence"
  end

  if config.extentMemoryLimit then
    azurite_cmd = azurite_cmd .. " --extentMemoryLimit " .. config.extentMemoryLimit
  end

  local job_id = vim.fn.jobstart(azurite_cmd, {
    detach = true,
    on_exit = function(_, exit_code)
      if exit_code ~= 0 then
        print("Azurite exited with code " .. exit_code)
      end
    end
  })

  table.insert(azurite_jobs, job_id)
end

local function stop_azurite(service)
  if service then
    for i = #azurite_jobs, 1, -1 do
      local job_id = azurite_jobs[i]
      local job_info = vim.fn.jobpid(job_id)
      if job_info ~= 0 then
        vim.fn.jobstop(job_id)
        table.remove(azurite_jobs, i)
      end
    end
  else
    for _, job_id in ipairs(azurite_jobs) do
      vim.fn.jobstop(job_id)
    end
    azurite_jobs = {}
  end
end

local function clean_azurite(service)
  local azurite_path = config.location
  if service then
    if service == "blob" then
      os.remove(azurite_path .. "/azurite_db_blob.json")
      os.remove(azurite_path .. "/azurite_db_blob_extent.json")
      vim.fn.delete(azurite_path .. "/blobstorage", "rf")
    elseif service == "queue" then
      os.remove(azurite_path .. "/azurite_db_queue.json")
      os.remove(azurite_path .. "/azurite_db_queue_extent.json")
      vim.fn.delete(azurite_path .. "/queuestorage", "rf")
    elseif service == "table" then
      os.remove(azurite_path .. "/azurite_db_table.json")
    end
  else
    os.remove(azurite_path .. "/azurite_db_blob.json")
    os.remove(azurite_path .. "/azurite_db_blob_extent.json")
    vim.fn.delete(azurite_path .. "/blobstorage", "rf")
    os.remove(azurite_path .. "/azurite_db_queue.json")
    os.remove(azurite_path .. "/azurite_db_queue_extent.json")
    vim.fn.delete(azurite_path .. "/queuestorage", "rf")
    os.remove(azurite_path .. "/azurite_db_table.json")
  end
end

vim.api.nvim_create_user_command("StartAzurite", function() start_azurite() end, {})
vim.api.nvim_create_user_command("CloseAzurite", function() stop_azurite() end, {})
vim.api.nvim_create_user_command("CleanAzurite", function() clean_azurite() end, {})

vim.api.nvim_create_user_command("StartBlobService", function() start_azurite("blob") end, {})
vim.api.nvim_create_user_command("CloseBlobService", function() stop_azurite("blob") end, {})
vim.api.nvim_create_user_command("CleanBlobService", function() clean_azurite("blob") end, {})

vim.api.nvim_create_user_command("StartQueueService", function() start_azurite("queue") end, {})
vim.api.nvim_create_user_command("CloseQueueService", function() stop_azurite("queue") end, {})
vim.api.nvim_create_user_command("CleanQueueService", function() clean_azurite("queue") end, {})

vim.api.nvim_create_user_command("StartTableService", function() start_azurite("table") end, {})
vim.api.nvim_create_user_command("CloseTableService", function() stop_azurite("table") end, {})
vim.api.nvim_create_user_command("CleanTableService", function() clean_azurite("table") end, {})

-- Define configuration commands
vim.api.nvim_create_user_command("SetAzuriteConfig", function(opts)
  local keys = vim.split(opts.args, " ", { trimempty = true })
  for i = 1, #keys, 2 do
    local key = keys[i]
    local value = keys[i + 1]
    config[key] = value
  end
end, { nargs = "+" })

vim.api.nvim_create_user_command("GetAzuriteConfig", function()
  for key, value in pairs(config) do
    print(key .. ": " .. tostring(value))
  end
end, {})


local framework = require('framework/framework.lua')
local http = require('http')
local json = require('json')
local Plugin = framework.Plugin
local HttpPlugin = framework.HttpPlugin

local params = framework.boundary.param
params.name = 'Spark Plugin'
params.version = '1.0'

function HttpPlugin:initialize(params)
	Plugin.initialize(self, params)
	
	self.reqOptions = {
		host = params.host,
		port = params.port,
		path = params.path
	}
end

function HttpPlugin:error(err)
	local msg = tostring(err)

	print(msg)
end

function HttpPlugin:makeRequest(reqOptions, successCallback)
	local req = http.request(reqOptions, function (res)


		local data = ''
		
		res:on('data', function (chunk)
			data = data .. chunk	
			successCallback(data)
			-- TODO: Verify when data its complete or when we need to use de end
		end)

		res:on('error', function (err)
			local msg = 'Error while receiving a responde: ' .. err
			self.error(msg)
		end)

	end)
	
	req:on('error', function (err)
		local msg = 'Error while sending a request: ' .. err
		self.error(msg)
	end)

	req:done()
end

function HttpPlugin:onPoll()
	self:makeRequest(self.reqOptions, function (data)
		self:parseResponse(data)
	end)
end

function HttpPlugin:parseResponse(data)
	local metrics = self:onParseResponse(data) 
	self:report(metrics)
end

function HttpPlugin:onParseResponse(data)
	-- To be overriden on class instance
	print(data)
	return {}
end



local plugin = HttpPlugin:new(params)

function get(key, map)
	return map[key]
end

function plugin:onParseResponse(data)
	local parsed = json.parse(data)	
	local result = {}
	result['SPARK_MASTER_WORKERS_COUNT'] = tonumber(get('value', get('master.workers', get('gauges', parsed))))
	return result
end

plugin:poll()




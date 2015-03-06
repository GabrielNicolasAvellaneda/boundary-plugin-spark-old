local framework = require('framework/framework.lua')
local http = require('http')
local json = require('json')
local Plugin = framework.Plugin
local HttpPlugin = framework.HttpPlugin

local params = framework.boundary.param
params.name = 'Spark Plugin'
params.version = '1.0'

local plugin = HttpPlugin:new(params)

function get(key, map)
	return map[key]
end

function plugin:onParseResponse(data)
	local parsed = json.parse(data)	
	local result = {}

	result['SPARK_MASTER_WORKERS_COUNT'] = tonumber(get('value', get('master.workers', get('gauges', parsed))))
	result['SPARK_MASTER_APPLICATIONS_RUNNING_COUNT'] = tonumber(get('value', get('master.apps', get('gauges', parsed))))
	result['SPARM_MASTER_APPLICATIONS_WAITING_COUNT'] = tonumber(get('value', get('master.waitingApps', get('gauges', parsed))))
	result['SPARK_MASTER_JVM_MEMORY_USED'] = tonumber(get('value', get('jvm.total.used', get('gauges', parsed))))
	result['SPARK_MASTER_JVM_MEMORY_COMMITTED'] = tonumber(get('value', get('jvm.total.committed', get('gauges', parsed))))
	result['SPARK_MASTER_JVM_HEAP_MEMORY_COMMITTED'] = tonumber(get('value', get('jvm.heap.committed', get('gauges', parsed))))
	result['SPARK_MASTER_JVM_HEAP_MEMORY_USED'] = tonumber(get('value', get('jvm.heap.used', get('gauges', parsed))))
	result['SPARK_MASTER_JVM_HEAP_MEMORY_USAGE'] = tonumber(get('value', get('jvm.heap.usage', get('gauges', parsed))))
	result['SPARK_MASTER_JVM_NONHEAP_MEMORY_COMMITTED'] = tonumber(get('value', get('jvm.non-heap.committed', get('gauges', parsed))))
	result['SPARK_MASTER_JVM_NONHEAP_MEMORY_USED'] = tonumber(get('value', get('jvm.non-heap.used', get('gauges', parsed))))
	result['SPARK_MASTER_JVM_NONHEAP_MEMORY_USAGE'] = tonumber(get('value', get('jvm.non-heap.usage', get('gauges', parsed))))

	return result
end

plugin:poll()




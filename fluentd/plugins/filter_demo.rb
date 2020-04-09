require 'fluent/plugin/filter'

module Fluent::Plugin
  class MobLabFilter < Filter
    Fluent::Plugin.register_filter('demo', self)

    def filter(tag, time, record)
      #demoHttpLog="172.23.0.1 - - [09/Apr/2020:02:30:13 +0000] \"GET /demo HTTP/1.1\" 200 45"
	    matchedDemoHttpLog = /^(?<Host>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\s+\S+\s+\S+\s+\[(?<Date>\S+\s+\S+)\]\s+"(?<Method>\w+)\s+(?<Path>\S+)\s+(?<Protocol>\S+)"\s+(?<StatusCode>\d+)\s+(?<Bytes>\d+)$/.match(record["log"])
      if matchedDemoHttpLog
        record["Host"] = matchedDemoHttpLog["Host"]
        record["Date"] = matchedDemoHttpLog["Date"]
        record["Method"] = matchedDemoHttpLog["Method"]
        record["Path"] = matchedDemoHttpLog["Path"]
        record["Protocol"] = matchedDemoHttpLog["Protocol"]
        record["StatusCode"] = matchedDemoHttpLog["StatusCode"]
        record["Bytes"] = matchedDemoHttpLog["Bytes"]
        return record
      end
      
      matchedHelloWorld = /(?<key>\w+),(?<value>\w+)/.match(record["log"])
	    if matchedHelloWorld
		  record[matchedHelloWorld["key"]] = matchedHelloWorld["value"]
	    end
	    record
	  end
  end
end
require 'fluent/plugin/filter'

module Fluent::Plugin
  class MobLabFilter < Filter
    Fluent::Plugin.register_filter('testtime', self)

    def filter(tag, time, record)
      #demoHttpLog="[2020-04-16T13:14:18.788+0800] xyz"
	    matchedDemoHttpLog = /^\[(?<Time>[^\]]+)\]\s+(?<Content>\S+)/.match(record["log"])
      if matchedDemoHttpLog
        record["Content"] = matchedDemoHttpLog["Content"]
        record["@timestamp"] = matchedDemoHttpLog["Time"]
      else
        record["xxxxxxx"]="false"
      end
	    record
	  end
  end
end
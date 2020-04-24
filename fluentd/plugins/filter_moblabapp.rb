require 'fluent/plugin/filter'

module Fluent::Plugin
  class MobLabFilter < Filter
    Fluent::Plugin.register_filter('moblabapp', self)

    def filter(tag, time, record)
      #[2020-04-14T18:11:06.051] [INFO] [Clients-API:GSX] - App listening on PORT 3000
      matchedDemoHttpLog = /^\[(?<Time>\S{20,})\]\s+\[(?<Level>\S+)\]\s+\[(?<Category>[^:]+):(?<Company>\w+)\]/.match(record["log"])
      if matchedDemoHttpLog
        record["@timestamp"] = matchedDemoHttpLog["Time"]
        record["Level"] = matchedDemoHttpLog["Level"]
        record["Category"] = matchedDemoHttpLog["Category"]
        record["Company"] = matchedDemoHttpLog["Company"]
      else
        record["normalized_log"]="false"
      end
	    return record
	  end
  end
end
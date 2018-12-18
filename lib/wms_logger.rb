require 'singleton'
class WMSLogger
    include Singleton
    def initialize
        @log = File.open("WMS logger.txt", "a")
    end
    
    def logInformation(information)
        @log.puts(information)
        @log.flush
    end
end
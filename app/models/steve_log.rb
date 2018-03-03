# class SteveLog
#   LogFile = Rails.root.join('log', 'steve.log')
#   class << self
#     cattr_accessor :logger
#     delegate :debug, :info, :warn, :error, :fatal, :to => :logger
#   end
# end
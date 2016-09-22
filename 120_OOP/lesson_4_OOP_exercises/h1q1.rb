# h1q1.rb

class SecretFile

  def initialize(secret_data)
    @data = secret_data
    @logger = SecurityLogger.new
  end

  def data
    @logger.create_log_entry(@data)
    @data
  end

end

class SecurityLogger
  attr_reader :log
  def initialize
    @log = []
  end

  def create_log_entry(entry)
    @log << entry
  end
end

secret_file = SecretFile.new("secret_message")
secret_file.data
secret_file.logger

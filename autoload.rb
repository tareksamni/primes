# frozen_string_literal: true

autoload_path = File.join(File.dirname(__FILE__), 'app', '**', '*.rb')
Dir[autoload_path].each { |f| require f }



module ErrorPage

  autoload :Middleware, 'error_page/middleware'

  def self.new(*args, &block)
    Middleware.new(*args, &block)
  end
  
  
end


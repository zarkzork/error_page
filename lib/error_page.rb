

module ErrorPage

  autoload :Middleware, 'error_page/middleware'

  def self.new(*args)
    Middleware.new(*args)
  end
  
  
end


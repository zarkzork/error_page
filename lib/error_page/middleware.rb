require 'rack'
require 'error_page/renderer'

module ErrorPage

  class Middleware
    
    def initialize(app, &block)
      @renderer = Renderer.new
      @app = app
      @block = block
    end
    
    def call(env)
      code, headers, body = begin
                              @app.call(env)
                            rescue StandardError, LoadError, SyntaxError
                              [500, nil, nil]
                            end
      if (500..599).include? code
        body = @renderer.instance_eval(&@block)
        Rack::ContentLength.new(Rack::ContentType.new(lambda{|env| [code, {}, body] })).call({})
      else
        [code, headers, body]
      end
    end
    
  end

end

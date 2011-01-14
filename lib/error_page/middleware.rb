require 'rack'
require 'error_page/renderer'

class ErrorPage
  
  def initialize(app, &block)
    @renderer = Renderer.new
    @app = app
    @block = block
  end
  
  def call(env)
    code, headers, body = begin
                            @app.call
                          rescue
                            [500, {}, nil]
                          end
    if (500..599).include? code
      body = @renderer.instance_eval &@block
      Rack::ContentLength.new(Rack::ContentType.new(lambda{|env| [code, headers, body] })).call({})
    else
      [code, headers, body]
    end
  end
  
end

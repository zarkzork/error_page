require 'tilt'

module ErrorPage

  class Renderer

    Default_options = {
      :path => 'views',
      :render_template => true,
      :layout => :layout
    }
    
    def initialize(options = {})
      @options = Default_options.merge(options)
      @cache = Tilt::Cache.new
    end

    Tilt.mappings.each_key do |key|
      define_method(key.to_sym) do |page|
        layout_path = File.join(@options[:path],
                                "#{@options[:layout]}.#{key}")
        template_path = File.join(@options[:path], "#{page}.#{key}")
        layout = compile(layout_path)
        template = compile(template_path)
        layout.render{ template.render }
      end
    end

    private

    def compile(path)
      @cache.fetch(path) { Tilt.new(path)}
    end

    def set(key, value)
      @options[key] = value
    end
    
  end

end

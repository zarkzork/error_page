require 'tilt'

module ErrorPage

  class Renderer

    Default_options = {
      :path => 'views',
      :render_layout => true,
      :layout => :layout
    }
    
    def initialize(options = {})
      @options = Default_options.merge(options)
      @cache = Tilt::Cache.new
    end

    Tilt.mappings.each_key do |key|
      define_method(key.to_sym) do |page|
        opt_path = @options[:path]
        layout_name =  "#{@options[:layout]}.#{key}"
        file_name = "#{page}.#{key}"
        
        layout_path = File.join(opt_path, layout_name)
        template_path = File.join(opt_path, file_name)
        template = compile(template_path)

        if @options[:render_layout]
          layout = compile(layout_path)
          layout.render{ template.render }
        else
          template.render
        end
      end
    end

    def set(key, value)
      @options[key] = value
    end

    private

    def compile(path)
      @cache.fetch(path) { Tilt.new(path)}
    end
    
  end

end

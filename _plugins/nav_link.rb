module Jekyll
  class NavLink < Liquid::Block
    def initialize(tag_name, url, tokens)
      super
      @url = url
    end

    def render(context)
      link = %{<a href="#{@url}">#{super}</a>}
      if current_page_active(context)
        %{<li class="active">#{link}</li>}
      else
        %{<li>#{link}</li>}
      end
    end

    private

    def current_page_active(context)
      page_url = context.environments.first["page"]["url"]
      [
        page_url,
        page_url.gsub(/\.html$/, ''),
        page_url.gsub(/index\.html$/, '')
      ].include? @url.gsub(/#.*$/, '')
    end
  end
end

Liquid::Template.register_tag('navlink', Jekyll::NavLink)

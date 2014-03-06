module PrettyUrls
  class Generator < Jekyll::Generator
    def generate(site)
      site.pages.each do |page|
        if page.name.split('/').last !~ /^index.\w+$/
          page.data['permalink'] ||= page.name.gsub(/\.\w+$/, '/index.html')
        end
      end
    end
  end
end

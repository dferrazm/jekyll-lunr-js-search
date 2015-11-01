require 'nokogiri'

module Jekyll
  module LunrJsSearch
    class PageRenderer
      def initialize(site)
        @site = site
      end

      # render the item, parse the output and get all text inside <p> elements
      def render(item)
        layoutless = item.dup
        # # return new hash based on the item's data but without the layout
        layoutless.data = item.data.select do |k,_|
          k != 'layout'
        end
        layoutless.render({}, @site.site_payload)
        Nokogiri::HTML(layoutless.output).text
      end
    end
  end
end

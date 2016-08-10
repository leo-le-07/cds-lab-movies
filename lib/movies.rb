require "movies/version"
require 'mechanize'

module Movies
  class Search
    attr_accessor :agent
    def initialize
      @agent = Mechanize.new
    end
    def films
      page.links_with(class: 'film-name').map(&:text)
    end
    def page
      @agent.get('http://www.123phim.vn/phim')
    end
  end
end

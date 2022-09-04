# frozen_string_literal: true

require_relative "parser/version"

module Webserver
  class LogParser
    def parse(file)
      lines = load_file(file)

      all_views = read_views(lines)
      page_views = read_page_views(all_views)
      unique_page_views = read_unique_page_views(all_views)

      { page_views: page_views, unique_page_views: unique_page_views }
    end

    private

    def load_file(file)
      File.open(file)
    end

    def read_views(lines)
      visits = Hash.new([])
      lines.each do |line|
        page, viewer = line.split(" ")
        visits[page] += [viewer]
      end
      visits
    end

    def read_page_views(all_views)
      all_views.sort_by { |_, views| -views.count }.collect do |page, views|
        "#{page} #{views.count} views"
      end
    end

    def read_unique_page_views(all_views)
      all_views.sort_by { |_, views| -views.uniq.count }.collect do |page, views|
        "#{page} #{views.uniq.count} unique views"
      end
    end
  end
end

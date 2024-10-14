class CrawlerController < ApplicationController
  def execute
    crawler = WebCrawler.new

    crawler.extract_data
  end
end

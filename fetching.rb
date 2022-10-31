require 'net/http'
require 'json'
require './secret.rb' # contains api_key
module WebServices
    class SimpleBase
      attr_reader :name
  
      def initialize(name)
        @name = name
      end
  
      def results
        if response.is_a?(Net::HTTPSuccess)
          JSON.parse(response.body)
        else
          response.to_s
        end
      end
      private
  
      def response
        @response ||= Net::HTTP.get_response(uri)
      end
  
      def uri
        @uri ||= URI(url)
      end
  
      def url
        @url ||= "https://api.windy.com/api/webcams/v2/list/category=beach/limit=50,200/property=live?key=#{api_key}&show=webcams:image,category,player,location"
      end
    end
  end

# Webcam.create("")
a = WebServices::SimpleBase.new("rails")
a.results["result"]["webcams"].each do |cam|
  lol = ""
  cam["category"].each do |cat|
    lol+=",#{cat["name"]}"
  end
  puts cam["title"] + lol
  # puts "#{cam["id"]} #{cam["title"]} #{cam["location"]["country"]}"
end
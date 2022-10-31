require 'net/http'
require 'json'
require_relative './secret.rb' # contains api_key
module WebServices
    class SimpleBase
      attr_reader :name
  
      def initialize(offset)
        @offset = offset
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
        @url ||= "https://api.windy.com/api/webcams/v2/list/limit=50,#{@offset}/property=live?key=#{api_key}&show=webcams:image,category,player,location"
      end
    end
  end
  n = 0
  50.times {
    a = WebServices::SimpleBase.new(50*n)
    a.results["result"]["webcams"].each do |cam|
        category_list = ""
        cam["category"].each do |cat|
            category_list+=",#{cat["name"]}"
        end
        Webcam.create(cam_id: cam["id"].to_i, 
            title: cam["title"], 
            location:cam["location"]["country"], 
            player_url:"https://webcams.windy.com/webcams/stream/#{cam["id"]}", 
            category:category_list,
            image_url:cam["image"]["current"]["thumbnail"])
    end
    n+=1
}
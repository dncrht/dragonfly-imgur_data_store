require 'dragonfly'
require 'imgurapi'
require 'net/http'
require 'uri'

Dragonfly::App.register_datastore(:imgur) { Dragonfly::ImgurDataStore }

module Dragonfly
  class ImgurDataStore

    def initialize(opts = {})
      @session = Imgurapi::Session.instance(opts)
    end

    def write(content, opts = {})
      image = @session.image.image_upload(content.file)
      image.id
    end

    def read(uid)
      body = Net::HTTP.get_response(URI.parse url_for(uid)).body
      body == '' ? nil : body
    rescue
      nil
    end

    def destroy(uid)
      @session.image.image_delete(uid)
    end

    def url_for(uid, opts = {})
      Imgurapi::Image.new(id: uid).url
    end
  end
end

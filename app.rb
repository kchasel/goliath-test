require 'goliath'
require 'em-synchrony'
require 'em-synchrony/em-http'

class Hello < Goliath::API
  def response(env)
    width, height = env['PATH_INFO'].scan(/\d+/).map(&:to_i)
    req = EM::HttpRequest.new("http://lorempixel.com/#{width || 200}/#{height || 300}/nightlife/").get

    res = req.response

    [200, {}, res]
  end
end

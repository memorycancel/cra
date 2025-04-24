# encoding: utf-8

require 'httpclient'
require 'hpricot'
require 'pry'
require 'uri'
require 'open-uri'
require 'json'

class HTTPClient
  alias original_initialize initialize

  def initialize(*args, &block)
    original_initialize(*args, &block)
    # Force use of the default system CA certs (instead of the 6 year old bundled ones)
    @session_manager&.ssl_config&.set_default_paths
  end
end

# @httpclient = HTTPClient.new
# can use environment variable 'http_proxy' or 'HTTP_PROXY' instead.
@httpclient = HTTPClient.new('http://127.0.0.1:10809')

class String
  # charset: gbk/gb2312 etc..
  def to_utf8(charset="gbk")
    @ec = Encoding::Converter.new(charset, "utf-8")
    @ec.convert self
  end
  def rm_label; self.match(/(?<=>).*(?=<)/).to_s rescue nil; end
  def rm_tag; self.gsub(/<\/?[^>]*>/,""); end
  def nums; self.match(/\d+/).to_s; end
  def rm_rackets; self.gsub(/（.*）/,"").gsub(/\(.*\)/,""); end
  def to_jsonp_hash
    eval self.gsub("JsonpCallBack(", "").chop
  end
end

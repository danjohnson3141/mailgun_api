require "rest-client"
require "json"
require "mailgun/list"
require "mailgun/message"

class Mailgun

  attr_accessor :host, :protocol, :api_version, :test_mode, :api_key, :domain, :response

  def initialize(params={})
    @host         = params.fetch(:host, "api.mailgun.net")
    @protocol     = params.fetch(:protocol, "https")
    @api_version  = params.fetch(:api_version, "v2")
    @test_mode    = params.fetch(:test_mode, false)
    @api_key      = params.fetch(:api_key) { raise ArgumentError.new(":api_key is a required argument to initialize Mailgun") if api_key.nil?}
    @domain       = params.fetch(:domain, nil)
  end

  def find_list(list_name)
    list = Gun::List.new(self)
    list.find("#{list_name}@#{domain}")
    list
  end

  def lists
    Gun::List.new(self).list
  end

  def create_list(list_name, options={})
    Gun::List.new(self).create("#{list_name}@#{domain}", options)
  end


  def create_message(params)
    Gun::Message.new(params)
  end


  # Returns the api url used in all Mailgun API calls
  def api_url
    "#{protocol}://api:#{api_key}@#{host}/#{api_version}"
  end
    

  def self.fire(method, url, parameters={})

    parameters = {:params => parameters} if method == :get    

    # puts method
    # puts url
    # puts parameters

    return JSON(RestClient.send(method, url, parameters))
  end

end

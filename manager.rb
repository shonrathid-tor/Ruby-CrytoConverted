require "uri"
require 'net/http'
require "json"
require "./coin"


class Manager
  @@repo =  {}
      def initialize

      end
    



  def initailize_repo
    response = web_scrap
    json = JSON.parse(response)
    for symbol ,values in json
      Coin.new(symbol, values['USD'], values['EUR'])
      @@repo[symbol] = coin
    end
  end




  def web_scrap
    url= "https://data-api.coindesk.com/spot/v1/markets?market=kraken"
    uri = URI(url)
    Net::HTTP.get(uri)
  end

  def coin_list
    @@repo.keys
  end


  
    def calculate(amount, symbol, to)
    coin = @@repo[symbol]
    amout*coin.send(to.to_sym)
  end




end
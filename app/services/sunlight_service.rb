class SunlightService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('http://congress.api.sunlightfoundation.com')
  end

  def legislators(criteria)
    parse(connection.get('legislators', criteria))[:results]
  end

  def committees(criteria)
    parse(connection.get('committees', criteria))[:results]
  end

  private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

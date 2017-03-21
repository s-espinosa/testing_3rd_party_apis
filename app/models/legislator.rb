class Legislator < OpenStruct
  attr_reader :service

  def self.service
    @service ||= SunlightService.new
  end

  def self.find_by(criteria)
    service.legislators(criteria).map do |legislator|
      Legislator.new(legislator)
    end
  end
end

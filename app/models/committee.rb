class Committee < OpenStruct
  attr_reader :service

  def self.service
    @service ||= SunlightService.new
  end

  def self.find_by(criteria)
    service.committees(criteria).map do |committee|
      Committee.new(committee)
    end
  end
end

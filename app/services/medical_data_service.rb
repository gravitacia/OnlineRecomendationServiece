require 'net/http'
require 'json'

class MedicalDataService
  BASE_URL = 'https://api.fda.gov/drug/event.json?limit=1'.freeze

  def self.get_medical_data
    uri = URI(BASE_URL)

    response = Net::HTTP.get(uri)

    if response.code.to_i == 200
      JSON.parse(response.body)
    else
      raise StandardError, "Unable to fetch medical data: #{response.body}"
    end
  end

end

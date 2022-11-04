module ApiCommons
  def format_json(json)
    JSON.parse(json)
  rescue JSON::ParserError
    JSON.parse(json.to_json)
  end

  def time_now
    Time.now.strftime('%d/%m/%Y %H:%M:%S.%L - GMT %z')
  end
end

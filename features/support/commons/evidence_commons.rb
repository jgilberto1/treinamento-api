module ApiCommons
  def generate_evidence(response)
    evidence_folder = FOLDER_PATH
    verb = response.request.http_method::METHOD
    evidence_file = "#{evidence_folder}/#{Time.now.strftime('%Hh%Mm%Ss%L')}_#{verb}.txt"
    request_response_log(response, evidence_file, verb)
  end

  def request_response_log(response, evidence_file, verb)
    print_logs(response, verb) if DEBUG
    generate_log_txt(response, evidence_file, verb)
  end

  def print_logs(response, verb)
    request_debug_console(response, verb)
    response_debug_console(response)
  end

  def request_debug_console(response, verb)
    Kernel.puts "\n========================= REQUEST ========================="
    Kernel.puts "#{verb}: #{response.request.options[:base_uri]}"
    Kernel.puts "HEADER: \n#{JSON.pretty_generate(response.request.options[:headers])}" unless response.body.empty?
    unless verb.eql?('GET') || verb.eql?('DELETE')
      Kernel.puts "BODY: \n#{JSON.pretty_generate(format_json(response.request.options[:body]))}"
    end
    Kernel.puts '==========================================================='
  end

  def response_debug_console(response)
    Kernel.puts "\n========================= RESPONSE ========================="
    Kernel.puts "STATUS: #{response.code}"
    # Begin inserido caso o servico nao retorne em formato json
    begin
      Kernel.puts JSON.pretty_generate(format_json(response.body)) unless response.body.empty?
    rescue StandardError
    end
    Kernel.puts '==========================================================='
  end

  def generate_log_txt(response, evidence_file, verb)
    File.open(evidence_file, 'w:ASCII-8BIT') do |f|
      f << "========================= REQUEST =========================\n"
      f << "ENDPOINT: #{response.request.options[:base_uri]}\n"
      f << "HTTP MÉTODO: #{verb}\n"
      f << "AMBIENTE: #{AMBIENTE.upcase}\n\n"
      f << "HEADER: \n#{JSON.pretty_generate(response.request.options[:headers])}\n" unless response.body.empty?
      unless verb.eql?('GET') || verb.eql?('DELETE')
        f << "\nBODY: \n#{JSON.pretty_generate(format_json(response.request.options[:body]))}\n"
      end
      f << "===========================================================\n\n"
      f << "========================= RESPONSE =========================\n"
      f << "Status: #{response.code}\n"
      f << "Response Header: \n"
      response.header.each { |key, value| f << "#{key}: #{value}\n" unless key.casecmp('authorization').zero? }
      # Begin inserido caso o servico nao retorne em formato json
      begin
        f << "#{JSON.pretty_generate(format_json(response.body))}\n" unless response.body.empty?
      rescue StandardError
      end
      f << "===========================================================\n\n"
    end
  end
end

include ApiCommons

World(REST)

Before do |scenario|
  @test_start = time_now
  day = Time.now.strftime('%Y%m%d')
  time = Time.now.strftime('%Hh%Mm%Ss%L')
  scenario_name = scenario.name.remover_acentos.titleize.gsub(/\W/, '')
  FOLDER_PATH ||= "reports/evidences/#{day}/#{time}_#{scenario_name}".freeze
  FileUtils.mkdir_p(FOLDER_PATH) unless Dir.exist?(FOLDER_PATH)
  Kernel.puts 'Ambiente: ' + AMBIENTE
end

After do |_scenario|
  Kernel.puts "Início: #{@test_start}"
  Kernel.puts "Término: #{time_now}"
  i = 0
  Dir[File.join(File.dirname(__FILE__), "../../#{FOLDER_PATH}/*.txt")].sort.each do |f|
    i += 1
    file_name = f.split('/').last.split('.').first
    attach('text/plain', "#{file_name}_evidencia_#{i}")
  end
end

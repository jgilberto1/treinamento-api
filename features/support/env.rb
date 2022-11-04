Dir[File.join(File.dirname(__FILE__), 'spec_helper/*.rb')].sort.each { |file| require file }
Dir[File.join(File.dirname(__FILE__), '../../fixtures/factories/**/*.rb')].sort.each { |file| require file }
Dir[File.join(File.dirname(__FILE__), 'commons/*.rb')].sort.each { |file| require file }

require 'rspec'
require 'httparty'
require 'pry'
require 'brstring'
require 'logger'

silence_warnings do
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end

PATH_API_REST ||= ENV['PATH_API_REST']
PATH_API_REST.nil? ? ENV['PATH_API_REST'] : PATH_API_REST

# Mapeamento dos arquivos de massa
API_DATA_SKUS ||= YAML.load_file(File.dirname(__FILE__) + '/data/skus.yml')
API_DATA_USERS ||= YAML.load_file(File.dirname(__FILE__) + '/data/users.yml')

# Mapeamento dos arquivos de configuracao dos endpoints
URL ||= YAML.load_file(File.dirname(__FILE__) + '/config/urls.yml')
ENDPOINT ||= YAML.load_file(File.dirname(__FILE__) + '/config/endpoints.yml')

# Mapeamento dos perfis de execucao
AMBIENTE ||= ENV['AMBIENTE']
SERVIDOR ||= ENV['SERVIDOR']
DEBUG ||= ENV['DEBUG']

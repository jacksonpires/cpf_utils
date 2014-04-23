# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cpf_utils/version'

Gem::Specification.new do |spec|
  spec.name          = "cpf_utils"
  spec.version       = CpfUtils::VERSION
  spec.authors       = ["Jackson Pires"]
  spec.email         = ["jackson.pires@gmail.com"]
  spec.description   = %q{Uma suíte de funcionalidades para o CPF.}
  spec.summary       = %q{Gera CPF para testes no formado tradicional ou apenas
                          numérico, testa se determinado número de CPF
                          é válido, além muitas outras funcionalidades descritas
                          na documentação.}
  spec.homepage      = "https://github.com/jacksonpires/cpf_utils"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 1.9.0'
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.2.2"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end

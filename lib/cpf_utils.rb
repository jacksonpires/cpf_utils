require "cpf_utils/version"
require "cpf_utils/string"
require "cpf_utils/cpf"

module CpfUtils

  # Gera um número de CPF.
  #
  # Exemplo:
  # CpfUtils.cpf => # "45698394823"
  def self.cpf
    Cpf.new(sample_numbers).generate_cpf
  end

  # Gera um número de CPF formatado.
  #
  # Exemplo:
  # CpfUtils.cpf_formatted => # "456.983.948-23"
  def self.cpf_formatted
    Cpf.new(sample_numbers).generate_cpf.to_cpf_format
  end

  # Verifica se um CPF é válido.
  #
  # Exemplo:
  # CpfUtils.valid_cpf?(45698394823) => # true
  # CpfUtils.valid_cpf?("45698394823") => # true
  # CpfUtils.valid_cpf?("456.983.948-23") => # true
  def self.valid_cpf?(cpf_number)
    cpf_number.to_s.valid_cpf?
  end

  private

  # Sorteia nove números para compor o um novo CPF
  def self.sample_numbers
    [*0..9].sample(9)
  end
end

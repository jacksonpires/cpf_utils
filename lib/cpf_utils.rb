require "cpf_utils/version"
require "cpf_utils/string"

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

  # Sorteia nove números para compor o um novo CPF
  def self.sample_numbers
    [*0..9].sample(9)
  end


  class Cpf

    # Acessor de leitura para os números
    attr_reader :numbers

    # Inicializador da classe
    def initialize(numbers)
      if numbers.is_a? String
        numbers = numbers.split('')
      elsif numbers.is_a? Fixnum
        numbers = numbers.to_s.split('')
      end

      @numbers = numbers
    end

    # Gera o CPF propriamente dito
    def generate_cpf
      @numbers << first_digit
      @numbers << second_digit
      @numbers.join("")
    end

    # Gera o primeiro dígito verificador
    def first_digit
      if @numbers.size == 9
        value = 0
        multipliers = [10,9,8,7,6,5,4,3,2]

        multipliers.each_with_index do |mult, index|
          value += @numbers[index].to_i * mult
        end

        check_remainder(value % 11)
      end
    end

    # Gera o segundo dígito verificador
    def second_digit
      if @numbers.size == 10
        value = 0
        multipliers = [11,10,9,8,7,6,5,4,3,2]

        multipliers.each_with_index do |mult, index|
          value += @numbers[index].to_i * mult
        end

        check_remainder(value % 11)
      end
    end

    # Checa o resto da divisão
    def check_remainder(remainder)
      if remainder < 2
        0
      else
        (11 - remainder)
      end
    end
  end
end

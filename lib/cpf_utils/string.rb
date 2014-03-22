class String

  # Verifica se uma máscara de CPF é válida:
  #
  # "456.983.948-23".valid_cpf_mask? => # true
  # "456.983..948-23".valid_cpf_mask? => # false
  def valid_cpf_mask?
    without_mask = !!(self =~ /^[+-]?[0-9]{11}+$/)
    with_mask = !!(self =~ /^[+-]?[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
    with_mask || without_mask
  end

  # Verifica se um CPF é válido:
  #
  # CpfUtils.valid_cpf?("47238051923") => # true
  # CpfUtils.valid_cpf?(47238051923) => # tru
  # CpfUtils.valid_cpf?("472.380.519-23") => # true
  def valid_cpf?
    if valid_cpf_mask?
      original_cpf = self.gsub(/\.?-?/,"",)
      tested_cpf = original_cpf[0..8]

      tested_cpf << CpfUtils::Cpf.new(original_cpf[0..8]).first_digit.to_s
      tested_cpf << CpfUtils::Cpf.new(tested_cpf[0..9]).second_digit.to_s

      tested_cpf == original_cpf ? true : false
    end
  end

  # Para formatar um número válido de CPF:
  #
  # "45698394823".to_cpf_format => # "456.983.948-23"
  def to_cpf_format
    if self.valid_cpf?
      "#{self[0..2]}.#{self[3..5]}.#{self[6..8]}-#{self[9..11]}"
    end
  end

  # Para gerar um número de CPF a partir de um número candidato:
  #
  # "456983948".generate_cpf => # "45698394823"
  def generate_cpf
    if !!(self =~ /^[+-]?[0-9]{9}+$/)
      final_cpf = self

      final_cpf << CpfUtils::Cpf.new(final_cpf[0..8]).first_digit.to_s
      final_cpf << CpfUtils::Cpf.new(final_cpf[0..9]).second_digit.to_s

      final_cpf
    end
  end

  # Para gerar um número de CPF formatado a partir de um número candidato:
  #
  # "456983948".generate_cpf_formatted => # "456.983.948-23"
  def generate_cpf_formatted
    generate_cpf.to_cpf_format
  end
end

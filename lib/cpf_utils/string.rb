class String

  # Verifica se uma máscara de CPF é válida:
  #
  # "456.983.948-23".valid_cpf_mask? => # true
  # "456.983..948-23".valid_cpf_mask? => # false
  def valid_cpf_mask?
    without_mask = !!(self =~ /^[0-9]{11}+$/)
    with_mask = !!(self =~ /^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
    with_mask || without_mask
  end

  # Verifica se um CPF é válido:
  #
  # "47238051923".valid_cpf? => # true
  # "472.380.519-23".valid_cpf? => # true
  def valid_cpf?
    if valid_cpf_mask?
      original_cpf = self.gsub(/\.?-?/,"",)
      tested_cpf = original_cpf[0..8]

      tested_cpf << CpfUtils::Cpf.new(original_cpf[0..8]).first_digit.to_s
      tested_cpf << CpfUtils::Cpf.new(tested_cpf[0..9]).second_digit.to_s

      valid_cpf = (tested_cpf == original_cpf) ? true : false
      blacklisted_cpf = !self.blacklisted_cpf?

      (valid_cpf == blacklisted_cpf) ? true : false
    end
  end

  # Para formatar um número válido de CPF:
  #
  # "45698394823".to_cpf_format => # "456.983.948-23"
  def to_cpf_format
     cleaned_cpf = self.gsub(/\.?-?/,"",)
    
    if cleaned_cpf.valid_cpf?
      "#{cleaned_cpf[0..2]}.#{cleaned_cpf[3..5]}.#{cleaned_cpf[6..8]}-#{cleaned_cpf[9..11]}"
    end
  end

  # Para gerar um número de CPF a partir de um número candidato:
  #
  # "456983948".generate_cpf => # "45698394823"
  def generate_cpf
    if !!(self =~ /^[0-9]{9}+$/)
      final_cpf = self

      final_cpf << CpfUtils::Cpf.new(final_cpf[0..8]).first_digit.to_s
      final_cpf << CpfUtils::Cpf.new(final_cpf[0..9]).second_digit.to_s

      final_cpf
    end
  end

  # Gera um número de CPF formatado a partir de um número candidato:
  #
  # "456983948".generate_cpf_formatted => # "456.983.948-23"
  def generate_cpf_formatted
    generate_cpf.to_cpf_format
  end

  # Verifica se o CPF é faz parte da blacklist
  # A blacklist consiste em CPFs inválidos como '111.111.111-11' e seus
  # derivados
  #
  # "11111111111".blacklisted_cpf? => # true
  def blacklisted_cpf?
    wihout_mask = self.gsub(/\.?-?/,"",)
    first_number = wihout_mask[0]
    wihout_mask.count(first_number) == 11 ? true : false
  end

  # Apelido 'mascara_de_cpf_valida' para o método valid_cpf_mask
  alias_method :mascara_de_cpf_valida?, :valid_cpf_mask?

  # Apelido 'cpf_valido?' para o método valid_cpf?
  alias_method :cpf_valido?, :valid_cpf?

  # Apelido 'para_formato_cpf' para o método to_cpf_format
  alias_method :para_formato_cpf, :to_cpf_format

  # Apelido 'gerar_cpf' para o método generate_cpf
  alias_method :gerar_cpf, :generate_cpf

  # Apelido 'gerar_cpf_formatado' para o método generate_cpf_formatted
  alias_method :gerar_cpf_formatado, :generate_cpf_formatted
end

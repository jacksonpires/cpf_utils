require "spec_helper"

describe String do
  it "#valid_cpf_mask?" do
    expect("123.456.789-12".valid_cpf_mask?).to be_true
    expect("12345678912".valid_cpf_mask?).to be_true
  end

  it "#mascara_de_cpf_valida?" do
    expect("123.456.789-12".mascara_de_cpf_valida?).to be_true
    expect("12345678912".mascara_de_cpf_valida?).to be_true
  end

  it "#valid_cpf_mask? - be false" do
    expect("123..456.789-12".valid_cpf_mask?).to be_false
    expect("123.456.789--12".valid_cpf_mask?).to be_false
    expect("123.456.789-1E".valid_cpf_mask?).to be_false
  end

  it "#mascara_de_cpf_valida? - be false" do
    expect("123..456.789-12".mascara_de_cpf_valida?).to be_false
    expect("123.456.789--12".mascara_de_cpf_valida?).to be_false
    expect("123.456.789-1E".mascara_de_cpf_valida?).to be_false
  end

  it "#valid_cpf?" do
    cpf = CpfUtils.cpf
    expect(cpf.valid_cpf?).to be_true
  end

  it "#cpf_valido?" do
    cpf = CpfUtils.cpf
    expect(cpf.cpf_valido?).to be_true
  end

  it "#to_cpf_format?" do
    cpf = CpfUtils.cpf
    expect(cpf.to_cpf_format).to match(/^[+-]?[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
  end

  it "#para_formato_cpf?" do
    cpf = CpfUtils.cpf
    expect(cpf.para_formato_cpf).to match(/^[+-]?[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
  end

  it "#generate_cpf" do
    valid_cpf = CpfUtils.cpf
    final_cpf = valid_cpf[0..8].generate_cpf

    expect(final_cpf).to be_a_kind_of(String)
    expect(final_cpf.length).to eql(11)
  end

  it "#gerar_cpf" do
    valid_cpf = CpfUtils.cpf
    final_cpf = valid_cpf[0..8].gerar_cpf

    expect(final_cpf).to be_a_kind_of(String)
    expect(final_cpf.length).to eql(11)
  end

  it "#gerar_cpf_formatado" do
    valid_cpf = CpfUtils.cpf
    final_cpf = valid_cpf[0..8].gerar_cpf_formatado

    expect(final_cpf).to match(/^[+-]?[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
  end

  it "#generate_cpf_formatted" do
    valid_cpf = CpfUtils.cpf
    final_cpf = valid_cpf[0..8].generate_cpf_formatted

    expect(final_cpf).to match(/^[+-]?[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
  end
end

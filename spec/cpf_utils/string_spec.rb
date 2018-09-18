require "spec_helper"

describe String do
  let(:valid_cpf) { CpfUtils.cpf }
  let(:valid_formatted_cpf) { CpfUtils.cpf_formatted }
  let(:invalid_cpf) { "11111111111" }

  it "#valid_cpf_mask?" do
    expect(valid_formatted_cpf.valid_cpf_mask?).to be_true
    expect(valid_cpf.valid_cpf_mask?).to be_true
  end

  it "#mascara_de_cpf_valida?" do
    expect(valid_formatted_cpf.mascara_de_cpf_valida?).to be_true
    expect(valid_cpf.mascara_de_cpf_valida?).to be_true
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
    expect(valid_cpf.valid_cpf?).to be_true
  end

  it "#valid_cpf? - false" do
    expect(invalid_cpf.valid_cpf?).to be_false
  end

  it "#cpf_valido?" do
    expect(valid_cpf.cpf_valido?).to be_true
  end

  it "#to_cpf_format? - with unformatted cpf" do
    expect(valid_cpf.to_cpf_format).to match(/^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
    expect(valid_formatted_cpf.to_cpf_format).to match(/^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
  end

  it "#para_formato_cpf?" do
    expect(valid_cpf.para_formato_cpf).to match(/^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
    expect(valid_formatted_cpf.para_formato_cpf).to match(/^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
  end
  
  it "#generate_cpf" do
    final_cpf = valid_cpf[0..8].generate_cpf

    expect(final_cpf).to be_a_kind_of(String)
    expect(final_cpf.length).to eql(11)
  end

  it "#gerar_cpf" do
    final_cpf = valid_cpf[0..8].gerar_cpf

    expect(final_cpf).to be_a_kind_of(String)
    expect(final_cpf.length).to eql(11)
  end

  it "#gerar_cpf_formatado" do
    final_cpf = valid_cpf[0..8].gerar_cpf_formatado

    expect(final_cpf).to match(/^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
  end

  it "#generate_cpf_formatted" do
    final_cpf = valid_cpf[0..8].generate_cpf_formatted

    expect(final_cpf).to match(/^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
  end

  it "#blacklisted_cpf? - true" do
    expect(invalid_cpf.blacklisted_cpf?).to be_true
  end

  it "#blacklisted_cpf? - false" do
    expect(valid_cpf.blacklisted_cpf?).to be_false
  end
end

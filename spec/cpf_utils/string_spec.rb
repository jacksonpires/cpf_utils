require "cpf_utils"

describe String do
  it "#valid_cpf_mask?" do
    expect("123.456.789-12".valid_cpf_mask?).to be_true
    expect("12345678912".valid_cpf_mask?).to be_true
  end

  it "#valid_cpf_mask? - be false" do
    expect("123..456.789-12".valid_cpf_mask?).to be_false
    expect("123.456.789--12".valid_cpf_mask?).to be_false
    expect("123.456.789-1E".valid_cpf_mask?).to be_false
  end

  it "#valid_cpf?" do
    cpf = CpfUtils.cpf
    expect(cpf.valid_cpf?).to be_true
  end

  it "#to_cpf_format?" do
    cpf = CpfUtils.cpf
    expect(cpf.to_cpf_format).to match(/^[+-]?[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
  end
end

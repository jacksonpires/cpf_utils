require "spec_helper"

describe CpfUtils do

  it ".cpf" do
    valid_cpf = CpfUtils.cpf
    expect(valid_cpf).to be_a_kind_of(String)
    expect(valid_cpf.length).to eql(11)
  end

  it ".cpf_formatted" do
    valid_cpf = CpfUtils.cpf_formatted
    expect(valid_cpf).to match(/^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
  end

  it ".cpf_formatado" do
    valid_cpf = CpfUtils.cpf_formatado
    expect(valid_cpf).to match(/^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
  end

  it ".valid_cpf?" do
    valid_cpf = CpfUtils.cpf
    expect(CpfUtils.valid_cpf? valid_cpf).to be_true
  end

  it ".cpf_valido?" do
    cpf_valido = CpfUtils.cpf
    expect(CpfUtils.cpf_valido? cpf_valido).to be_true
  end

  it ".valid_cpf? - be false" do
    invalid_cpf = "123.456.789-12"
    expect(CpfUtils.valid_cpf? invalid_cpf).to be_false
  end

  it ".sample_numbers" do
    numbers = CpfUtils.sample_numbers
    expect(numbers.size).to eql(9)
    expect(numbers).to be_a_kind_of(Array)
  end
end

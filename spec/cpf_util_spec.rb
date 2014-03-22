require "cpf_utils"

describe CpfUtils do
  context 'CpfUtils' do
    it ".cpf" do
      valid_cpf = CpfUtils.cpf
      expect(valid_cpf).to be_a_kind_of(String)
      expect(valid_cpf.length).to eql(11)
    end

    it ".cpf_formatted" do
      valid_cpf = CpfUtils.cpf_formatted
      expect(valid_cpf).to match(/^[+-]?[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}+$/)
    end

    it ".valid_cpf?" do
      valid_cpf = CpfUtils.cpf
      expect(CpfUtils.valid_cpf? valid_cpf).to be_true
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

  context 'CpfUtils::Cpf' do
    it "#initialize - Text" do
      cpf = CpfUtils::Cpf.new("123456789")
      expect(cpf.numbers).to be_a_kind_of(Array)
      expect(cpf.numbers.size).to eql(9)
    end

    it "#initialize - Fixnum" do
      cpf = CpfUtils::Cpf.new(123456789)
      expect(cpf.numbers).to be_a_kind_of(Array)
      expect(cpf.numbers.size).to eql(9)
    end

    it "#initialize - Array" do
      cpf = CpfUtils::Cpf.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      expect(cpf.numbers).to be_a_kind_of(Array)
      expect(cpf.numbers.size).to eql(9)
    end

    it "#generate_cpf" do
      cpf = CpfUtils::Cpf.new("123456789")
      complete_cpf = cpf.generate_cpf
      expect(complete_cpf.size).to eql(11)
    end

    it "#first_digit" do
      cpf = CpfUtils::Cpf.new("123412345")
      first_digit = cpf.first_digit
      expect(first_digit).to eql(2)
    end

    it "#first_digit - false" do
      cpf = CpfUtils::Cpf.new("123")
      first_digit = cpf.first_digit
      expect(first_digit).to be_false
    end

    it "#second_digit" do
      cpf = CpfUtils::Cpf.new("1234567891")
      second_digit = cpf.second_digit
      expect(second_digit).to eql(7)
    end

    it "#second_digit - false" do
      cpf = CpfUtils::Cpf.new("123")
      second_digit = cpf.second_digit
      expect(second_digit).to be_false
    end

    it "#check_remainder" do
      cpf = CpfUtils::Cpf.new("1234567891")
      expect(cpf.check_remainder(0)).to eql(0)
      expect(cpf.check_remainder(1)).to eql(0)
      expect(cpf.check_remainder(2)).to eql(9)
    end
  end
end

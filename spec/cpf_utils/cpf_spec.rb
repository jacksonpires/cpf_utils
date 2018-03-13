require "spec_helper"

describe CpfUtils do
  context 'CpfUtils::Cpf' do
    it "#initialize - Text" do
      cpf = CpfUtils::Cpf.new("123456789")
      expect(cpf.numbers).to be_a_kind_of(Array)
      expect(cpf.numbers.size).to eql(9)
    end

    it "#initialize - Integer" do
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

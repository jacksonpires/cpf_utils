# CpfUtils
[![Build status](https://secure.travis-ci.org/jacksonpires/cpf_utils.png)](https://secure.travis-ci.org/jacksonpires/cpf_utils)
[![Code Climate](https://codeclimate.com/github/jacksonpires/cpf_utils.png)](https://codeclimate.com/github/jacksonpires/cpf_utils)

CpfUtils é uma suite de funcionalidades para CPF.
O CpfUtils é capaz de gerar CPF para testes no formado tradicional ou apenas numérico, testa se determinado número de CPF é válido, gera dígitos verificadores para determinado número candidato a CPF, dentre outras coisas.

## Instalação

Adicione essa linha na Gemfile da sua aplicação:

    gem 'cpf_utils'

E então execute:

    $ bundle

Ou instale você mesmo, conforme abaixo:

    $ gem install cpf_utils

## Uso

O CpfUtils é muito fácil de usar, por exempo:

    # Para gerar um número de CPF:
    CpfUtils.cpf => # "45698394823"

    # Para gerar um CPF formatado:
    CpfUtils.cpf_formatted => # "456.983.948-23"

    # Para verificar se um CPF é válido:
    CpfUtils.valid_cpf?("47238051923") => # true
    CpfUtils.valid_cpf?(47238051923) => # true
    CpfUtils.valid_cpf?("472.380.519-23") => # true

    # Outra forma de verificar se um CPF é válido:
    "45698394823".valid_cpf? => # true
    "456.983.948-23".valid_cpf? => # true

    # Para verificar se uma máscara de CPF é válida:
    "456.983.948-23".valid_cpf_mask? => # true
    "456.983..948-23".valid_cpf_mask? => # false

    # Para formatar um número válido de CPF:
    "45698394823".to_cpf_format => # "456.983.948-23"

    # Para gerar um número de CPF a partir de um número candidato:
    "456983948".generate_cpf => # "45698394823"

    # Para gerar um número de CPF formatado a partir de um número candidato:
    "456983948".generate_cpf_formatted => # "456.983.948-23"

## Contribuindo

1. Faça um Fork
2. Crie um branch para a nova funcionalidade (`git checkout -b my-new-feature`)
3. Faça o commit de suas alterações  (`git commit -am 'Add some feature'`)
4. Faça um push da sua nova funconalidade (`git push origin my-new-feature`)
5. Submeta uma nova Pull Request

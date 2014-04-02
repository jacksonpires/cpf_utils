# Require Code Climate Test Reporter
require "codeclimate-test-reporter"

# Starts Code Climate Test Reporter
CodeClimate::TestReporter.start

# Require Coveralls for Test cover
require 'coveralls'

# Starts Coderalls
Coveralls.wear!

# Require other files of project
require "cpf_utils"
require_relative "../lib/cpf_utils/cpf"

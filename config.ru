# frozen_string_literal: true

require_relative './app'
set :bind, '0.0.0.0'
set :port, 9292
run TalentBase

# frozen_string_literal: true

require 'sinatra'
require 'sinatra/flash'
require './lib/talent_tool'

class TalentBase < Sinatra::Base
  enable :sessions, :method_override
	set :public_folder, File.expand_path("../../public", __FILE__)

  get '/' do
    erb :index
  end
  run! if app_file == $PROGRAM_NAME
end

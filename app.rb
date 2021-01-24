# frozen_string_literal: true

require 'sinatra'
require 'sinatra/flash'
require './lib/talent_tool'

class TalentBase < Sinatra::Base
  enable :sessions, :method_override

  before do
    @contact = TalentTool.instance
  end

  get '/' do
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    @contact = TalentTool.create
    @contact.add_talent(params[:name], params[:location], params[:date_of_birth])
  end

  get '/search' do
    erb :search
  end

  post '/search' do
    @contact = TalentTool.create
    @contact.filter(params[:location])
    @contact.result
    erb :result
  end

  run! if app_file == $PROGRAM_NAME
end

require_relative 'config/environment'
require_relative './models/piglatinizer.rb'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    @text = params[:user_phrase]
    PigLatinizer.new.piglatinize(@text)
  end

end

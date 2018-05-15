require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    platinizer = PigLatinizer.new
    @translated_phrase = platinizer.piglatinize(params[:user_phrase])

    erb :results
  end

end

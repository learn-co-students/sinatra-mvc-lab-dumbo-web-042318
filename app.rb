require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :user_input
  end

  # get '/piglatinize' do
  #   erb :result
  # end
  post '/piglatinize' do
    txt = params[:user_phrase]
    new_pl = PigLatinizer.new(txt)
    @text_from_user = new_pl.piglatinize_all
    erb :piglatinize
  end

end

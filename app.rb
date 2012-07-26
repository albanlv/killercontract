# dev hint: shotgun login.rb

require 'rubygems'
require 'sinatra'
require 'bundler'
Bundler.require :default


PDFKit.configure do |config|
    config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
    config.default_options = {
        'margin-top' => 0,
        'margin-bottom' => 0,
        'margin-left' => 0,
        'margin-right' => 0
    }
end

get '/download_statuts' do
    content_type 'application/pdf'
    url = 'Mon pdf de test'
    kit = PDFKit.new url
    kit.to_pdf
end

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

helpers do
  def username
    session[:identity] ? session[:identity] : 'Hello stranger'
  end
end

before '/secure/*' do
  if !session[:identity] then
    session[:previous_url] = request['REQUEST_PATH']
    @error = 'Sorry guacamole, you need to be logged in to do that'
    halt erb(:login_form)
  end
end

get '/' do
  erb :home
end

get '/login/form' do 
  erb :login_form
end

post '/login/attempt' do
  session[:identity] = params['username']
  where_user_came_from = session[:previous_url] || '/'
  redirect to where_user_came_from 
end

get '/logout' do
  session.delete(:identity)
  erb "<div class='alert-message'>Logged out</div>"
end


get '/secure/place' do
  erb "This is a secret place that only <%=session[:identity]%> has access to!"
end

post '/killer_contract' do
  @contrated_name = params[:contracted_name]
  puts @contracted_name
  @client_name = params[:client_name]
  puts @client_name
  @contracted_address = params[:contracted_address]
  puts @contracted_address
  @mission = params[:mission]
  puts @mission
  @total_price = params[:total_price]
  puts @total_price 
  @price_per_hour = params[:price_per_hour]
  puts @price_per_hour
  @date = params[:date]
  puts @date
  @payment_schedule = params[:payment_schedule]
  puts @payment_schedule
end

get '/welcome' do 
  erb :welcome
end

get '/about' do
    erb :about
end

$LOAD_PATH.unshift(Dir.getwd)

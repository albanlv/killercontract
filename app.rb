# dev hint: shotgun login.rb

require 'rubygems'
require 'sinatra'
require 'bundler'
Bundler.require :default

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

get '/' do
  erb :welcome
end

get '/welcome' do 
  erb :welcome
end

get '/about' do
    erb :about
end

post '/killer_contract' do
  @contracted_name = params[:contracted_name]
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
  @currency = params[:currency]
  puts @currency
  erb :killer_contract
end

$LOAD_PATH.unshift(Dir.getwd)

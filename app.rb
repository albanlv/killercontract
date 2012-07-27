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

post '/website_development' do
  @developer_name = params[:developer_name]
  puts @developer_name
  @developer_status = params[:developer_status]
  puts @developer_status
  @company_name = params[:company_name]
  puts @company_name
  @company_business = params[:company_business]
  puts @company_business
  @notice_delay = params[:notice_delay]
  puts @notice_delay
  @cure_delay = params[:cure_delay]
  puts @cure_delay
  @copyright_delay = params[:copyright_delay]
  puts @copyright_delay
  @maintenance_period = params[:maintenance_period]
  puts @maintenance_period
  @warranty_period = params[:warranty_period]
  puts @warranty_period
  @delay = params[:delay]
  puts @delay
  @first_payment = params[:first_payment]
  puts @first_payment
  @second_payment = params[:second_payment]
  puts @second_payment
  @third_payment = params[:third_payment]
  puts @third_payment
  @price_per_hour = params[:price_per_hour]
  puts @price_per_hour
  
  erb :website_development
end

$LOAD_PATH.unshift(Dir.getwd)

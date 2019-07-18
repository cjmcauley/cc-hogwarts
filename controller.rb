require 'sinatra'
require 'sinatra/reloader'
require_relative './models/student'
also_reload './models/*'

get '/' do
  @students = Student.all
  erb(:students)
end

require 'sinatra'
require 'sinatra/reloader'
require_relative './models/student'
also_reload './models/*'

get '/students' do
  @students = Student.all
  erb(:students)
end

post '/students' do
  p params
  @student = Student.new(params)
  @student.save
  redirect '/students'
end

get '/students/new' do
  erb(:new_student)
end

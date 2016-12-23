require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

helpers do
  def isolate_name(file_path)
    File.basename(file_path, '.*')
  end
end


data_path = File.expand_path('../data', __FILE__)

# displays list of available question types
get '/' do
  pattern = File.join(data_path, '*')
  @file_paths = Dir.glob(pattern)

  erb :index
end


# displays a question of the given type
get '/quiz/:questiontype' do
  file = params[:questiontype] + '.yml'
  file_path = File.join(data_path, file)
  question_set = YAML.load_file(file_path)
  @question = question_set[rand(question_set.size)]

  erb :quiz
end

# Requirements
# 1. menu page
#   - list of available question types
#   - selecting (?button, link?) a type takes to question page
#   
# 2. question page
#   - user presented with a question of selected type
#   - given options: 
#     - see question again soon
#     - next question
#     - menu
#     
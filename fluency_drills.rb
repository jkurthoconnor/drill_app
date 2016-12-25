require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

require 'pry'


data_path = File.expand_path('../data', __FILE__)

helpers do
  def isolate_name(file_path)
    File.basename(file_path, '.*')
  end
  
  def list_other_categories(paths)
    others = paths.reject { |type| type.include?(params[:type] || '') }
    others.map { |type| isolate_name(type) }
  end
  
  def divide_into_steps(drills)
    drills.split(/\s{2}/)
  end
end

before do
  pattern = File.join(data_path, '*')
  @file_paths = Dir.glob(pattern)
end


# displays list of available question types
get '/' do
  
  erb :index
end


# displays a question of the given type
get '/question/:type' do
  file = params[:type] + '.yml'
  file_path = File.join(data_path, file)
  question_set = YAML.load_file(file_path)
  @drill = question_set[rand(question_set.size)]

  erb :quiz
end


# styling
  # update hash, range, sting files with a separator to demarkate subquestions;
  #    - introduce some formatting/parsing to style << get rid of bullets!!
  # 
# Requirements
# 
# question page
#   - user is given options to rank question difficulty
#    
# add an edit page
    # - allow editing of questions
    # - allow adding new questions

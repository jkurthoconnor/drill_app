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
    # binding.pry
    others = paths.reject { |type| type.include?(params[:type]) }
    others.map { |type| isolate_name(type) }
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
  # add title header to layout, banner style
  # throughout use buttons (actual form buttons || links styled as buttons)
  # use a separator to demarkate lines / subquestions in yaml files;
  #    - introduce some formatting/parsing to style
  # 
# Requirements
# 
# question page
#   - user is given options: 
#     - rank question difficulty
#    
# add an edit page
    # - allow editing of questions
    # - allow adding new questions
    
# improve index page (or remove it?)

# move quiz.erb footer to layout; will need to modify list_others...
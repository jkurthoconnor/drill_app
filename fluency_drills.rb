require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'


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


# env = {"GATEWAY_INTERFACE"=>"CGI/1.1", "PATH_INFO"=>"/question/string", "QUERY_STRING"=>"", "REMOTE_ADDR"=>"127.0.0.1", "REMOTE_HOST"=>"127.0.0.1", "REQUEST_METHOD"=>"GET", "REQUEST_URI"=>"http://localhost:4567/question/string", "SCRIPT_NAME"=>"", "SERVER_NAME"=>"localhost", "SERVER_PORT"=>"4567", "SERVER_PROTOCOL"=>"HTTP/1.1", "SERVER_SOFTWARE"=>"WEBrick/1.3.1 (Ruby/2.3.1/2016-04-26)", "HTTP_HOST"=>"localhost:4567", "HTTP_CONNECTION"=>"keep-alive", "HTTP_CACHE_CONTROL"=>"max-age=0", "HTTP_UPGRADE_INSECURE_REQUESTS"=>"1", "HTTP_USER_AGENT"=>"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36", "HTTP_ACCEPT"=>"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8", "HTTP_DNT"=>"1", "HTTP_REFERER"=>"http://localhost:4567/", "HTTP_ACCEPT_ENCODING"=>"gzip, deflate, sdch, br", "HTTP_ACCEPT_LANGUAGE"=>"en-US,en;q=0.8", "rack.version"=>[1, 3], "rack.input"=>#, "rack.errors"=>#>, "rack.multithread"=>true, "rack.multiprocess"=>false, "rack.run_once"=>false, "rack.url_scheme"=>"http", "rack.hijack?"=>true, "rack.hijack"=>#, "rack.hijack_io"=>nil, "HTTP_VERSION"=>"HTTP/1.1", "REQUEST_PATH"=>"/question/string", "sinatra.commonlogger"=>true, "rack.logger"=>#, @formatter=nil, @logdev=#>, @mon_owner=nil, @mon_count=0, @mon_mutex=#>>, "rack.request.query_string"=>"", "rack.request.query_hash"=>{}, "sinatra.route"=>"GET /question/:type"}

# params =  {"splat"=>[], "captures"=>["string"], "type"=>"string"}
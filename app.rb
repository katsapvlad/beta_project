#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'




before do 
	@db = SQLite3::Database.new 'blog.db'
	@db.results_as_hash = true
end

configure do
	@db = SQLite3::Database.new 'blog.db'
	@db.results_as_hash = true
	@db.execute 'CREATE TABLE IF NOT EXISTS "Posts" (
	"id"	INTEGER,
	"created_date"	TEXT,
	"content"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);'
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/new' do
	erb :new			
end

post '/new' do

	@content = params[:content]
	if @content.size <= 0
		@error = 'Type post text!'
		return erb :new
	else 
		return erb "succes!"
	end

end
require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')


get('/') do
  @words = Word.all
  erb(:homepage)
end

get('/homepage') do
  @words = Word.all
  erb(:homepage)
end

get('/homepage/new') do
  erb(:new_word)
end

post('/homepage') do 
  name = params[:word_new]
  word = Word.new(name, nil)
  word.save()
  @words = Word.all()
  erb(:homepage)
end

get('/homepage/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:definitions)
end

post('/homepage/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:word_def], @word.id, nil)
  definition.save()
  erb(:definitions)
end

# Need to add routes for updating and deleting definitions, and test paths.


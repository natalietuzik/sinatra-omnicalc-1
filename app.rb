require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

# square sec

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2

  erb(:square_results)
end

# square root sec

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do

  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num **0.5

  erb(:square_root_results)
end

# random sec

get("/random/new") do
  erb(:new_random)
end

get ("/random/results") do
  @the_min_num = params.fetch("users_min_number").to_f
  @the_max_num = params.fetch("users_max_number").to_f
  @the_result = rand(@the_min_num..@the_max_num)

  erb(:random_results)
end

# payment sec

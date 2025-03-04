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
get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do

  @the_apr = params.fetch("users_apr_number").to_f
  @p_apr = format("%.4f%%", @the_apr)
  @the_num_yrs = params.fetch("users_num_yrs_number").to_i
  @principal = params.fetch("users_pri_number").to_f
  @p_principal = format("$%0.2f", @principal).gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')

  @r = user_apr / 100 / 12
  @numerator = @the_num_yrs * 12
  @p = (@r * @p_principal) / (1 - ((1 + @r) ** (-@numerator)))
  @p_result = format("$%0.2f", @p).gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')

  erb(:payment_results)
end

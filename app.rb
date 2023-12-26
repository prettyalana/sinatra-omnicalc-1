require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:square_calc)
end

get("/square/results") do
  @the_num = params.fetch("user_num").to_f
  @the_results = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("user_num").to_f
  @the_results = Math.sqrt(@the_num) 
  erb(:square_root_results)
end

get("/payment/new") do
erb(:payment_calc)
end

get("/payment/results") do
  @the_apr = params.fetch("user_apr").to_f
  @r = (@the_apr/100)/12
  @the_number_of_years = params.fetch("user_num_of_years").to_i
  @n = @the_number_of_years * 12
  @the_principal = params.fetch("user_principal").to_f
  @payment = @r * @the_principal / (1 - (1 + @r) ** -@n)
erb(:payment_results)
end

get("/random/new") do
  erb(:random_number)
end

get("/random/results") do
  @min_num = params.fetch("min_number").to_f
  @max_num = params.fetch("max_number").to_f
  @rand_num = rand(@min_num..@max_num)
  erb(:random_number_results)
end

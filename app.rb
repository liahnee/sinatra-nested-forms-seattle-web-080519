require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    
    get '/pirates' do
      @pirate = Pirate.all
      @ships = Ship.all
      erb :'pirates/new'
    end
    
    get '/pirates/new' do
      erb :'pirates/new'
    end

    get '/pirates/show' do
      erb :'pirates/show'
    end

    post '/pirates' do
      # puts params
      # binding.pry
      pirate_name = params["pirate"]["name"]
      weight = params['pirate']['weight']
      height = params['pirate']['height']

      Pirate.new(pirate_name, weight, height) 
    
      ship_name_1 = params['pirate']['ships'][0]
      s_name_1 = ship_name_1['name']
      ship_type_1 = params['pirate']['ships'][0]
      s_type_1 = ship_type_1['type']
      ship_booty_1 = params['pirate']['ships'][0]
      s_booty_1 = ship_booty_1['booty']
      # binding.pry
      Ship.new(s_name_1, s_type_1, s_booty_1)

      ship_name_2 = params['pirate']['ships'][1]
      s_name_2 = ship_name_2['name']
      ship_type_2 = params['pirate']['ships'][1]
      s_type_2 = ship_type_2['type']
      ship_booty_2 = params['pirate']['ships'][1]
      s_booty_2 = ship_booty_2['booty']
      # binding.pry
      Ship.new(s_name_2, s_type_2, s_booty_2)

      @all_pirates = Pirate.all
      @all_ships = Ship.all
      erb :'pirates/show' 
    end

  end
end

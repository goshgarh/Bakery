require "sinatra"
require "./class_sweets"
require "mailgun"

cookie1 = Cookies.new("Pakhlava1","Lorem1 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$20")
cookie2 = Cookies.new("Pakhlava2","Lorem2 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$18")
cookie3 = Cookies.new("Pakhlava3","Lorem3 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$21")
cookie4 = Cookies.new("Pakhlava4","Lorem4 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$22")
cookie5 = Cookies.new("Pakhlava5","Lorem5 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$19")

muffin1 = Muffins.new("Shakarbura1","Lorem6 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$16")
muffin2 = Muffins.new("Shakarbura2","Lorem7 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$25")
muffin3 = Muffins.new("Shakarbura3","Lorem8 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$27")
muffin4 = Muffins.new("Shakarbura4","Lorem9 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$24")
muffin5 = Muffins.new("Shakarbura5","Lorem10 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$30")

cake1= Cakes.new("Cake1","Lorem11 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$15")
cake2= Cakes.new("Cake2","Lorem12 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$21")
cake3= Cakes.new("Cake3","Lorem13 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$23")
cake4= Cakes.new("Cake4","Lorem14 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$27")
cake5= Cakes.new("Cake5","Lorem15 ipsum dolor sit amet, consectetur adipisicing elit. Placeat aperiam rerum ut tenetur, amet officiis!", "$25")


get('/')  do 
  

    erb(:index)
        
end

get ("/menu")  do 

    
      @cookie1 = cookie1
      @cookie2 = cookie2
      @cookie3 = cookie3
      @cookie4 = cookie4
      @cookie5 = cookie5
      
      @muffin1 = muffin1
      @muffin2 = muffin2
      @muffin3 = muffin3
      @muffin4 = muffin4
      @muffin5 = muffin5
      
      @cake1 = cake1
      @cake2 = cake2
      @cake3 = cake3
      @cake4 = cake4
      @cake5 = cake5
    
    erb(:menu)
end

get ("/contact") do
   
    erb(:contact)
end

get ("/all_list") do
   
    erb(:all_list)
end

post("/send-email")  do 
   p params
    
    # First, instantiate the Mailgun Client with your API key
mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']

# Define your message parameters
message_params =  { from: 'goshgarh@gmail.com',
                    to:   params[:email],
                    subject: 'The Bakery sweets are delicious!',
                    html: erb(:all_list)
#                    text:    'It is really easy to send a message!'
    
                  }

# Send your message through the client
mg_client.send_message ENV['MAILGUN_API_DOMAIN'],message_params
    
    
    redirect("/contact")
end



class Cookies
    attr_reader :cookie, :descr, :price
    def initialize(cookie, descr, price)
         @cookie = cookie
         @descr = descr
         @price = price
         
    end    
end

class Muffins
    attr_reader :muffin, :descr, :price
    def initialize(muffin, descr, price)
         @muffin = muffin
         @descr = descr
         @price = price
         
    end    
end

class Cakes
    attr_reader :cake, :descr, :price
    def initialize(cake, descr, price)
         @cake = cake
         @descr = descr
         @price = price
         
    end    
end


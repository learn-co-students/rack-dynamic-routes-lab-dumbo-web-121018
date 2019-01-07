#require 'pry'
class Application
#  @@items =[Item.new("Figs",3.42),Item.new("Pears",0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      #binding.pry
      item_name = req.path.split("/").last

      if item = @@items.find{|s| s.name == item_name}
        resp.status = 200

      resp.write item.price
    else
      resp.status = 400
      resp.write "Item not found"
    end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end

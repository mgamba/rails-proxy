RailsProxy::Application.routes.draw do

  proxy_app = Rack::Builder.new do
    use MidWare
    map "/" do
      run ExternalProxy.new
    end
  end

  mount proxy_app, at: "/proxy/:remote_name/*remote_path"

end

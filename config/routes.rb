RailsProxy::Application.routes.draw do

  mount ExternalProxy.new, at: "/proxy/:remote_name/*remote_path"

end

require 'rack-proxy'
require 'rack'

RemoteHostForName = {
  'simple' => "localhost:4567"
}

class ExternalProxy < Rack::Proxy
  def rewrite_env(env)
    #request = Rack::Request.new(env)
    path_params = env["action_dispatch.request.path_parameters"]

    env["HTTP_HOST"] = RemoteHostForName[path_params[:remote_name]]
    env["SCRIPT_NAME"] = '/'+path_params[:remote_path]
    env
  end
end

RailsProxy::Application.routes.draw do

  mount ExternalProxy.new, at: "/proxy/:remote_name/*remote_path"

end

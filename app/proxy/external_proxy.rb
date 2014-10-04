require 'rack-proxy'
require 'rack'

class ExternalProxy < Rack::Proxy
  RemoteHostForName = {
    'simple' => "localhost:4567"
  }

  def rewrite_env(env)
    #request = Rack::Request.new(env)
    path_params = env["action_dispatch.request.path_parameters"]

    env["HTTP_HOST"] = RemoteHostForName[path_params[:remote_name]]
    env["SCRIPT_NAME"] = '/'+path_params[:remote_path]+'/'+Thing.find(1).value
    env
  end
end

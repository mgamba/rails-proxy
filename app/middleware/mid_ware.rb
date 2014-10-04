class MidWare
  def initialize(app)
    @app = app
  end

  def call(env)
    env['middling'] = "You've been Middled!"
    @app.call(env)
  end
end

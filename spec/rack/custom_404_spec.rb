describe Rack::Custom404 do
  it "does nothing if the app returns non-404 response" do
    session = session_for(successful_app)

    session.get "/"

    expect(session.last_response.body).to eq "success"
  end

  it "serves a 404 page if the app returns 404" do
    session = session_for(not_found_app("hit the 404"))

    session.get "/"

    expect(session.last_response.body).to eq "hit the 404"
  end

  def session_for(app)
    Rack::Test::Session.new(Rack::MockSession.new(app))
  end

  def successful_app
    Rack::Builder.new do
      use Rack::Custom404, "whatever"

      run lambda { |env| [200, env, ["success"]] }
    end
  end

  def not_found_app(body)
    Rack::Builder.new do
      use Rack::Custom404, body

      run lambda { |env| [404, env, ["shouldn't get here"]] }
    end
  end
end

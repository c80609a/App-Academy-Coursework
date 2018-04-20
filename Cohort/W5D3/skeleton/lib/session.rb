require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  # passed an instance of the request on init
  def initialize(req)
    cooked = req.cookies['_rails_lite_app']
    if cooked
      @cookie = JSON.parse(cooked)
    else
      @cookie = {}
    end
  end

  def [](key)
    @cookie[key]
  end

  def []=(key, val)
    @cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)

    cooked = { path: '/', value: @cookie.to_json }
    res.set_cookie("_rails_lite_app", cooked)
  end
end

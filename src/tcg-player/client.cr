require "spoved/api/client"

class TCGPlayer::Client < Spoved::Api::Client
  @expires : Time = Time.utc(2016, 2, 15, 10, 20, 30)
  @token : String = ""

  def initialize(@pub_key : String, @priv_key : String, **args)
    super(**args.merge({
      host:     "api.tcgplayer.com",
      api_path: "",
    }))

    fetch_token
  end

  def fetch_token
    headers = {
      "Content-Type" => "application/x-www-form-urlencoded",
    }
    body = "grant_type=client_credentials&client_id=#{@pub_key}&client_secret=#{@priv_key}"
    token = post("token", body, extra_headers: headers)

    # Wed, 08 Jun 2022 17:51:08 GMT
    issued = Time.parse!(token[".issued"].as_s, "%a, %d %b %Y %H:%M:%S %Z")
    @expires = (issued + Time::Span.new(seconds: token["expires_in"].as_i))
    @token = token["access_token"].as_s
    @default_headers["Authorization"] = "Bearer #{@token}"
    @token
  end

  def refresh_token
    if @expires < Time.utc
      logger.info { "Token has expired. Refreshing." }
      fetch_token
    end
  end
end

require "./client/**"

class TCGPlayer::Client < Spoved::Api::Client
  def catalog
    TCGPlayer::Client::Catalog.new(self)
  end
end

require "../spec_helper"

describe Tcg::Player::Client do
  it "initializes" do
    client = Tcg::Player::Client.new(ENV["TCGP_PUBLIC_KEY"], ENV["TCGP_PRIVATE_KEY"])
    client.should be_a(Tcg::Player::Client)
  end

  it "fetches token" do
    client = Tcg::Player::Client.new(ENV["TCGP_PUBLIC_KEY"], ENV["TCGP_PRIVATE_KEY"])
    client.fetch_token.should be_a(String)
  end

  it "#category" do
    client = Tcg::Player::Client.new(ENV["TCGP_PUBLIC_KEY"], ENV["TCGP_PRIVATE_KEY"])
    client.category.should be_a(Tcg::Player::Client::Categories)
    data = client.category.all
    data.should be_a(Tcg::Player::ResponseList(Tcg::Player::Category))
    data.results.size.should be > 0
  end
end

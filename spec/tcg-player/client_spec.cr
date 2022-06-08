require "../spec_helper"

describe TCGPlayer::Client do
  it "initializes" do
    client = new_client
    client.should be_a(TCGPlayer::Client)
  end

  it "fetches token" do
    client = new_client
    client.fetch_token.should be_a(String)
  end
end

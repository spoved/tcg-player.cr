struct Tcg::Player::Client::Catalog
  @client : Tcg::Player::Client

  def initialize(@client); end

  def category
    Tcg::Player::Client::Categories.new(self)
  end
end

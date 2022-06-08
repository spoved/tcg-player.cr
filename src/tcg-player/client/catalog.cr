struct TCGPlayer::Client::Catalog
  @client : TCGPlayer::Client

  def initialize(@client); end

  def category
    TCGPlayer::Client::Categories.new(@client)
  end
end

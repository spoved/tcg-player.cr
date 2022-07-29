struct TCGPlayer::Client::Catalog
  @client : TCGPlayer::Client

  def initialize(@client); end

  def category
    TCGPlayer::Client::Categories.new(@client)
  end

  def product
    TCGPlayer::Client::Products.new(@client)
  end

  def sku(sku_id)
    @client.refresh_token
    @client.get("catalog/sku/#{category_id}", klass: TCGPlayer::Response(TCGPlayer::Product::SKU))
  end
end

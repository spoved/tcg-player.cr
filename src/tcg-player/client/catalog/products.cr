struct TCGPlayer::Client::Products
  @client : TCGPlayer::Client

  def initialize(@client); end

  def all(limit = 10, offset = 0)
    @client.refresh_token
    @client.get("catalog/products", params: {
      limit:  limit,
      offset: offset,
    }, klass: TCGPlayer::ResponseList(TCGPlayer::Product))
  end

  def get(product_id)
    @client.refresh_token
    @client.get("catalog/products/#{product_id}", klass: TCGPlayer::Response(TCGPlayer::Product))
  end

  def skus(product_id)
    @client.refresh_token
    @client.get("catalog/products/#{product_id}/skus", klass: TCGPlayer::Response(TCGPlayer::Product::Sku))
  end
end

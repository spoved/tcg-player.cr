struct TCGPlayer::Client::Categories
  @client : TCGPlayer::Client

  def initialize(@client); end

  def all
    @client.refresh_token
    @client.get("catalog/categories", klass: TCGPlayer::ResponseList(TCGPlayer::Category))
  end

  def get(category_id)
    @client.refresh_token
    @client.get("catalog/categories/#{category_id}", klass: TCGPlayer::Response(TCGPlayer::Category))
  end

  def search_manifest(category_id)
    @client.refresh_token
    @client.get("catalog/categories/#{category_id}/search/manifest", klass: TCGPlayer::Response(TCGPlayer::SearchManifest))
  end

  def groups(category_id)
    @client.refresh_token
    @client.get("catalog/categories/#{category_id}/groups", klass: TCGPlayer::ResponseList(TCGPlayer::Category::Group))
  end
end

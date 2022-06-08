struct Tcg::Player::Category
  include JSON::Serializable

  @[JSON::Field(key: "categoryId")]
  property category_id : Int32

  property name : String

  @[JSON::Field(key: "modifiedOn")]
  property modified_on : String

  @[JSON::Field(key: "displayName")]
  property display_name : String

  @[JSON::Field(key: "seoCategoryName")]
  property seo_category_name : String

  @[JSON::Field(key: "sealedLabel")]
  property sealed_label : String?

  @[JSON::Field(key: "nonSealedLabel")]
  property non_sealed_label : String?

  @[JSON::Field(key: "conditionGuideUrl")]
  property condition_guide_url : String

  @[JSON::Field(key: "isScannable")]
  property is_scannable : Bool

  property popularity : Int32

  @[JSON::Field(key: "isDirect")]
  property is_direct : Bool
end

struct Tcg::Player::Client::Categories
  @client : Tcg::Player::Client

  def initialize(@client); end

  def all
    @client.refresh_token
    @client.get("catalog/categories", klass: Tcg::Player::ResponseList(Tcg::Player::Category))
  end

  def get(category_id)
    @client.refresh_token
    @client.get("catalog/categories/#{category_id}", klass: Tcg::Player::ResponseList(Tcg::Player::Category))
  end
end

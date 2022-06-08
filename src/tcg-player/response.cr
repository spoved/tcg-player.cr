struct Tcg::Player::ResponseList(T)
  include JSON::Serializable

  @[JSON::Field(key: "totalItems")]
  property total_items : Int32
  property success : Bool
  property errors : Array(String)
  property results : Array(T)
end

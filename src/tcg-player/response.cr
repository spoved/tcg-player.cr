struct TCGPlayer::Response(T)
  include JSON::Serializable

  property success : Bool
  property errors : Array(String)
  property results : Array(T)
end

struct TCGPlayer::ResponseList(T)
  include JSON::Serializable

  @[JSON::Field(key: "totalItems")]
  property total_items : Int32
  property success : Bool
  property errors : Array(String)
  property results : Array(T)
end

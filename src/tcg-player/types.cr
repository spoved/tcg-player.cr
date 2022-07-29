module TCGPlayer
  struct Category
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

    struct Group
      include JSON::Serializable

      @[JSON::Field(key: "groupId")]
      property group_id : Int32

      property name : String

      property abbreviation : String

      @[JSON::Field(key: "isSupplemental")]
      property is_supplemental : Bool

      @[JSON::Field(key: "publishedOn")]
      property published_on : String

      @[JSON::Field(key: "modifiedOn")]
      property modified_on : String

      @[JSON::Field(key: "categoryId")]
      property category_id : Int32
    end
  end

  struct SearchManifest
    include JSON::Serializable

    property sorting : Array(Sorting)

    property filters : Array(Filter)

    struct Filter
      include JSON::Serializable

      property name : String

      @[JSON::Field(key: "displayName")]
      property display_name : String

      @[JSON::Field(key: "inputType")]
      property input_type : String

      property items : Array(Sorting)
    end

    struct Sorting
      include JSON::Serializable

      property text : String

      property value : String
    end
  end

  struct Product
    include JSON::Serializable

    @[JSON::Field(key: "productId")]
    property product_id : Int32

    property name : String

    @[JSON::Field(key: "cleanName")]
    property clean_name : String

    @[JSON::Field(key: "imageUrl")]
    property image_url : String

    @[JSON::Field(key: "categoryId")]
    property category_id : Int32

    @[JSON::Field(key: "groupId")]
    property group_id : Int32

    property url : String

    @[JSON::Field(key: "modifiedOn")]
    property modified_on : String

    struct Sku
      include JSON::Serializable

      @[JSON::Field(key: "skuId")]
      property sku_id : Int32

      @[JSON::Field(key: "productId")]
      property product_id : Int32

      @[JSON::Field(key: "languageId")]
      property language_id : Int32

      @[JSON::Field(key: "printingId")]
      property printing_id : Int32

      @[JSON::Field(key: "conditionId")]
      property condition_id : Int32
    end

    struct Price
      include JSON::Serializable

      @[JSON::Field(key: "productId")]
      property product_id : Int32

      @[JSON::Field(key: "lowPrice")]
      property low_price : Float64?

      @[JSON::Field(key: "midPrice")]
      property mid_price : Float64?

      @[JSON::Field(key: "highPrice")]
      property high_price : Float64?

      @[JSON::Field(key: "marketPrice")]
      property market_price : Float64?

      @[JSON::Field(key: "directLowPrice")]
      property direct_low_price : Float64?

      @[JSON::Field(key: "subTypeName")]
      property sub_type_name : String
    end
  end

  class MarketPrice
    include JSON::Serializable

    @[JSON::Field(key: "productConditionId")]
    property product_condition_id : Int32

    property price : Float64?

    @[JSON::Field(key: "lowestRange")]
    property lowest_range : Float64?

    @[JSON::Field(key: "highestRange")]
    property highest_range : Float64?
  end
end

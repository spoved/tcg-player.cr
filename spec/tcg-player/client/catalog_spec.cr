require "../../spec_helper"

describe TCGPlayer::Client::Catalog do
  client = new_client

  describe "#category" do
    category = client.catalog.category
    it "#all" do
      category.should be_a(TCGPlayer::Client::Categories)
      data = category.all
      data.should be_a(TCGPlayer::ResponseList(TCGPlayer::Category))
      data.results.size.should be > 0
    end

    it "#get" do
      data = category.get(1)
      data.should be_a(TCGPlayer::Response(TCGPlayer::Category))
      data.results.size.should eq 1
    end

    it "#search_manifest" do
      data = category.search_manifest(1)
      data.should be_a(TCGPlayer::Response(TCGPlayer::SearchManifest))
      data.results.size.should eq 1
    end

    it "#groups" do
      data = category.groups(1)
      data.should be_a(TCGPlayer::ResponseList(TCGPlayer::Category::Group))
      data.results.size.should eq 10
    end
  end

  describe "#product" do
    product = client.catalog.product

    it "#all" do
      product.should be_a(TCGPlayer::Client::Products)
      data = product.all
      data.should be_a(TCGPlayer::ResponseList(TCGPlayer::Product))
      data.results.size.should be > 0
    end

    it "#get" do
      data = product.get(254781)
      data.should be_a(TCGPlayer::Response(TCGPlayer::Product))
      data.results.size.should eq 1
    end

    it "#skus" do
      data = product.skus(254781)
      data.should be_a(TCGPlayer::Response(TCGPlayer::Product::Sku))
      data.results.size.should be > 1
    end
  end
end

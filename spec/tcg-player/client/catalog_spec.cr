require "../../spec_helper"

describe TCGPlayer::Client::Catalog do
  client = new_client

  it "#category.all" do
    client.catalog.category.should be_a(TCGPlayer::Client::Categories)
    data = client.catalog.category.all
    data.should be_a(TCGPlayer::ResponseList(TCGPlayer::Category))
    data.results.size.should be > 0
  end

  it "#category.get" do
    client.catalog.category.should be_a(TCGPlayer::Client::Categories)
    data = client.catalog.category.get(1)
    data.should be_a(TCGPlayer::Response(TCGPlayer::Category))
    data.results.size.should eq 1
  end

  it "#category.search_manifest" do
    data = client.catalog.category.search_manifest(1)
    data.should be_a(TCGPlayer::Response(TCGPlayer::SearchManifest))
    data.results.size.should eq 1
  end

  it "#category.groups" do
    client.catalog.category.should be_a(TCGPlayer::Client::Categories)
    data = client.catalog.category.groups(1)
    data.should be_a(TCGPlayer::ResponseList(TCGPlayer::Category::Group))
    data.results.size.should eq 10
  end
end

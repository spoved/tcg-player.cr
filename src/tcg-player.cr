module TCGPlayer
  VERSION = {{ `shards version "#{__DIR__}"`.chomp.stringify }}
end

require "./tcg-player/*"

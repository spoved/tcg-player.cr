require "spec"
require "../src/tcg-player"
require "vcr"

Spec.before_suite do
  spoved_logger :trace, bind: true, clear: true
  load_cassette("spec-cassette")
end

def new_client
  TCGPlayer::Client.new(ENV["TCGP_PUBLIC_KEY"], ENV["TCGP_PRIVATE_KEY"])
end

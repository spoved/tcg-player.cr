require "spec"
require "../src/tcg-player"
require "vcr"

Spec.before_suite do
  spoved_logger :trace, bind: true, clear: true
  load_cassette("spec-cassette")
end

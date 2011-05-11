require File.expand_path( "../helper", __FILE__ )

# Uses minitest
# @see http://bfts.rubyforge.org/minitest/
# @see https://github.com/seattlerb/minitest

describe Ymlconfiguration do
  it "can read a yml" do
    Ymlconfiguration.init :env => "test"
    Ymlconfiguration.yml("service").refute_nil
  end
end

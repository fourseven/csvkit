require_relative '../../test_helper'
describe CSVKit do
  it "must be defined" do
    CSVKit::VERSION.wont_be_nil
  end
end

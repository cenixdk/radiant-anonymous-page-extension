require File.dirname(__FILE__) + '/../spec_helper'

describe AnonymousPage do
  before(:each) do
    @anonymous_page = AnonymousPage.new
  end

  it "should be valid" do
    @anonymous_page.should be_valid
  end
end

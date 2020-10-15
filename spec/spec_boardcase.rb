require_relative '../lib/app/boardcase.rb'

describe "boardcase" do

  describe "initialize" do
    it "should no return nil" do
      expect(get_townhall_urls(page_mairies)).not_to be_nil
    end
    it "should equal 185" do
      expect(get_townhall_urls(page_mairies).length).to eq(185)
    end
  end

  describe "get_townhall_names" do

  end



end

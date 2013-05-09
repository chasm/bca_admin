require 'spec_helper'

describe ApplicationController do
  let (:uuid_match) { /[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}/ }
  describe "get_uuids()" do
    it "responds with a single UUID in a JSON array" do
      ac = ApplicationController.new
      expect(ac.get_uuids(1)[0]).to match uuid_match
    end
    
    it "responds with multiple UUIDs in a JSON array" do
      ac = ApplicationController.new
      uuids = ac.get_uuids(3)
      expect(uuids[0]).to match uuid_match
      expect(uuids[1]).to match uuid_match
      expect(uuids[2]).to match uuid_match
    end
  end
end
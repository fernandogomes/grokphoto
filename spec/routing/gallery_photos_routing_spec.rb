require "spec_helper"

describe Admin::GalleryPhotosController do
  describe "routing" do

    before(:each) do
      @gallery_id = FactoryGirl.create(:gallery).id
    end

    it "routes to #destroy" do
      delete("/admin/galleries/#{@gallery_id}/gallery_photos/1").should route_to("admin/gallery_photos#destroy", :id => "1", :gallery_id => @gallery_id.to_s)
    end

  end
end

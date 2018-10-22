require 'rails_helper'

RSpec.describe "SunsApis", type: :request do
  describe "GET /suns_apis" do
    before do
      @sun = FactoryBot.create(:sun)
    end

    it "works!" do
      get suns_path
      expect(response).to have_http_status(200)
    end


    it "adds a new data of sun" do
      params_sun = FactoryBot.attributes_for(:sun)
      expect {
        post suns_path, params: { sun: params_sun }
      }.to change(Sun, :count).by(1)
    end

    it "edits a given sun" do
      @new_sun = Sun.new(head_name: 'new head', tail_name: 'new tail')
      params_sun = FactoryBot.attributes_for(:sun).merge(head_name: @new_sun.head_name, tail_name: @new_sun.tail_name)
      get edit_sun_path(@sun.id), params: { params:  params_sun}
      expect(response).to have_http_status(200)
    end

    it "deletes a given sun" do
      params_sun = FactoryBot.attributes_for(:sun)
      expect {
        delete sun_path(@sun.id),
               params: { params: params_sun }
        }.to change(Sun, :count).by(-1)
    end
  end
end

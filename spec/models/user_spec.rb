require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:user_top_artist_images) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end

require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "model validations" do
    it "requires a title, all the time" do
      album = Album.new

      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:title)
    end

    context "validating released_year" do
      it "requires a year, all the time" do
        album = Album.new

        expect(album).to_not be_valid
        expect(album.errors.keys).to include(:released_year)
      end

      ["lololol", 10.0, 95].each do |invalid_year|
        it "doesn't validate #{invalid_year} for released_year" do
          album = Album.new(released_year: invalid_year)

          expect(album).to_not be_valid
          expect(album.errors.keys).to include(:released_year)
        end
      end
    end
  end
end

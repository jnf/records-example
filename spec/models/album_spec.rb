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

  describe "available_formats scope" do
    # positive test - includes unique formats
    it "has all the unique formats in alphabetical order" do
      album1 = Album.create(title: 'a', released_year: 1999, label_code: 'l', format: 'a format')
      album3 = Album.create(title: 'a', released_year: 1999, label_code: 'l', format: 'c format')
      album2 = Album.create(title: 'a', released_year: 1999, label_code: 'l', format: 'b format')

      correct_order = [album1.format, album2.format, album3.format]
      expect(Album.available_formats).to eq correct_order
    end

    # negative test - excludes duplicates formats
    it "excludes duplicate formats" do
      album1 = Album.create(title: 'a', released_year: 1999, label_code: 'l', format: 'a format')
      album3 = Album.create(title: 'a', released_year: 1999, label_code: 'l', format: 'a format')
      album2 = Album.create(title: 'a', released_year: 1999, label_code: 'l', format: 'b format')

      correct_order = [album1.format, album2.format]
      expect(Album.available_formats).to eq correct_order
    end
  end

  describe "on scope" do
    before :each do
      @label = Label.create(title: 'Fancy Label')
      Album.create(label: @label, title: 'a', released_year: 1999, label_code: 'l', format: 'a format')
      Album.create(label: @label, title: 'b', released_year: 1999, label_code: 'l', format: 'a format')
      Album.create(label: @label, title: 'c', released_year: 1999, label_code: 'l', format: 'a format')

      some_other_label = Label.create(title: 'Unfancy Label')
      @excluded_album = Album.create(label: some_other_label, title: 'd', released_year: 1999, label_code: 'l', format: 'a format')
    end

    it "includes only the records on the provided label" do      
      expect(Album.on(@label).count).to eq 3
      expect(Album.on(@label)).to_not include(@excluded_album)
    end
  end
end

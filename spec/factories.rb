FactoryGirl.define do
  factory :album do
    title "an album title"
    released_year "1999"
    label_code "a label code"
    format "a format of some sort"
  end

  factory :label do
    title "Label Name"
  end
end

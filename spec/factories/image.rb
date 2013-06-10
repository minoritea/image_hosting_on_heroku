FactoryGirl.define do
  factory :sample1, class: Image do
    title 'sample1'
    image Moped::BSON::Binary.new(
      :generic,
      File.open(File.dirname(File.dirname(__FILE__)) + '/static_files/test.jpg', 'rb').read
    )
  end
end
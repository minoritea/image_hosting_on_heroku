require 'spec_helper'

describe Image do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "should be saved" do
    image = FactoryGirl.build(:sample1)
    image.save.should be_true
  end
  it "shoud contain the above data" do
    image = Image.where(title: FactoryGirl.build(:sample1).title).first
    image.title.should == 'sample1'
    image.image.data.should == File.open(File.expand_path("../../static_files/test.jpg",__FILE__), 'rb').read
  end
end
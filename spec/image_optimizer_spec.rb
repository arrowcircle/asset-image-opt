require 'spec_helper'

describe AssetImageOpt do
  before :each do
    `cp -R spec/test_files/app .`
    @opt = AssetImageOpt.new
  end

  after :each do
    `rm -Rf app`
  end
  it "should get list of all images in assets folder" do
    AssetImageOpt.get_files_for_ext("png").count.should == 16
    AssetImageOpt.get_files_for_ext("jpg").count.should == 12
    AssetImageOpt.get_files_for_ext("jpeg").count.should == 9
  end

  it "should get all images" do
    AssetImageOpt.get_files.count.should == 37
  end

  it "should set size of all files" do
    opt = AssetImageOpt.new
    opt.initial_size.should == 1544307
  end

  it "should compress images" do
    opt = AssetImageOpt.new
    opt.optimize
    opt.optimized_size.should < opt.initial_size
  end
end
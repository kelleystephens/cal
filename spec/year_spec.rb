require_relative '../lib/year'

RSpec.describe Year do
  context ".year_header" do
    it "should print out 2000 centered in 62 spaces" do
      year = Year.new(2000)
      year.year_header.should == "                             2000"
    end

    it "should print out 1900 centered in 62 spaces" do
      year = Year.new(1900)
      year.year_header.should == "                             1900"
    end

    it "should print out 2012 centered in 62 spaces" do
      year = Year.new(2012)
      year.year_header.should == "                             2012"
    end

    it "should print out 2814 centered in 62 spaces" do
      year = Year.new(2814)
      year.year_header.should == "                             2814"
    end
  end

  context ".leap?" do
    it "should tell if 2000 is a leap year" do
      year = Year.new(2000)
      year.leap?.should == true
    end

    it "should tell if 1900 is a leap year" do
      year = Year.new(1900)
      year.leap?.should == false
    end

    it "should tell if 2012 is a leap year" do
      year = Year.new(2012)
      year.leap?.should == true
    end

    it "should tell if 2014 is a leap year" do
      year = Year.new(2014)
      year.leap?.should == false
    end
  end

    # it "should..." do
    #
    # end
#   end
end

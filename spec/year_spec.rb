require_relative '../lib/year'

RSpec.describe Year do
  context ".year_header" do
    it "should print out 2000 centered in 62 spaces" do
      Year.new(2000).year_header.should == "                             2000"
    end

    it "should print out 1900 centered in 62 spaces" do
      Year.new(1900).year_header.should == "                             1900"
    end

    it "should print out 2012 centered in 62 spaces" do
      Year.new(2012).year_header.should == "                             2012"
    end

    it "should print out 2814 centered in 62 spaces" do
      Year.new(2814).year_header.should == "                             2814"
    end
  end

  context ".leap?" do
    it "should tell if 2000 is a leap year" do
      Year.new(2000).leap?.should == true
    end

    it "should tell if 1900 is a leap year" do
      Year.new(1900).leap?.should == false
    end

    it "should tell if 2012 is a leap year" do
      Year.new(2012).leap?.should == true
    end

    it "should tell if 2014 is a leap year" do
      Year.new(2814).leap?.should == false
    end
  end

  context ".month_header" do
    it "should print the 3 month names strung together" do
      Year.new(2000).month_header(0).should == "      January               February               March\n"
    end

    it "should print the 3 month names strung together" do
      Year.new(1900).month_header(1).should == "       April                  May                   June\n"
    end

    it "should print the 3 month names strung together" do
      Year.new(2012).month_header(2).should == "        July                 August              September\n"
    end

    it "should print the 3 month names strung together" do
      Year.new(2014).month_header(3).should == "      October               November              December\n"
    end
  end

  context ".week_days" do
    it "should print Su - Sa 3x strung together" do
      Year.new(2014).week_days.should == "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
    end
  end

  context ".days" do
    it "should print 1 week for the 3 months strung together" do
      Year.new(2017).days(0, [1, 2, 3]).should == " 1  2  3  4  5  6  7            1  2  3  4            1  2  3  4\n"
    end

    it "should print 1 week for the 3 months strung together" do
      Year.new(2017).days(1, [1, 2, 3]).should == " 8  9 10 11 12 13 14   5  6  7  8  9 10 11   5  6  7  8  9 10 11\n"
    end

    it "should print 1 week for the 3 months strung together" do
      Year.new(2017).days(2, [4, 5, 6]).should == " 9 10 11 12 13 14 15  14 15 16 17 18 19 20  11 12 13 14 15 16 17\n"
    end

    it "should print 1 week for the 3 months strung together" do
      Year.new(2017).days(3, [4, 5, 6]).should == "16 17 18 19 20 21 22  21 22 23 24 25 26 27  18 19 20 21 22 23 24\n"
    end

    it "should print 1 week for the 3 months strung together" do
      Year.new(2017).days(4, [7, 8, 9]).should == "23 24 25 26 27 28 29  27 28 29 30 31        24 25 26 27 28 29 30\n"
    end

    it "should print 1 week for the 3 months strung together" do
      Year.new(2017).days(5, [10, 11, 12]).should == "                                            31\n"
    end
  end
end

require_relative '../lib/zellers_congruence'

RSpec.describe ZellersCongruence do
  context ".calculate" do
    it "should find the day of the week for the first day of June 2014" do
      ZellersCongruence.calculate(6, 2014).should == 0
    end

    it "should find the day of the week for the first day of July 2017" do
      ZellersCongruence.calculate(7, 2017).should == 6
    end

    it "should find the day of the week for the first day of August 2013" do
      ZellersCongruence.calculate(8, 2013).should == 4
    end

    it "should find the day of the week for the first day of Feb 2000 (leap year)" do
      ZellersCongruence.calculate(2, 2000).should == 2
    end
  end
end

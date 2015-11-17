def convert(in_arabic)
  ""
end

describe "Converting arabic numbers to roman numerals" do

  context "Romans don't have 0" do

    # degenerate case
    it "converts 0 to a blank string" do
      expect(convert(0)).to eq("")
    end

    # 1st rule based case - next example is the one that adds variation to my system after setting up the structure with a degenerate case
    it "converts 1 to I" do
      expect(convert(1)).to eq("I")
    end
  end
end


# I = 1, X=10, L = 50, D=500, M=1000
# http://literacy.kent.edu/Minigrants/Cinci/romanchart.htm
# based on Corey's convert kata here: http://blog.coreyhaines.com/2012/12/roman-numerals-kata-with-commentary.html

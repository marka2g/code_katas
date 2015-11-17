def convert(in_arabic)
  # ""
  # as we move forward getting subsequent examples to pass, we want to make sure to not have previous examples start failing
  return "" if in_arabic.zero? #this is a guard clause - CH uses this alot as a technique to 'wall off' the previous code
  # also note that the first failure we got was a bad value.  we expected "I" but got empty string, while this one takes us back to nil
  # nil to constant is a wonderfully simple transformation according to TPP. we can enact that transformation to get this example passing
  "I"
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

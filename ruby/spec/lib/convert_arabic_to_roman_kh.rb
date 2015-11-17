def convert(in_arabic)
  return "" if in_arabic.zero?
  # here i'm essentially testing against the nil case; a gaurd clause to the rescue!
  return "I" if in_arabic == 1 # convert(5) -> expected: "V", got nil
  # now we are back to an expectation failure around nil so we can use the nil to constant transformation to
  # get this passing
  "V"
end

describe "Converting arabic numbers to roman numerals" do

  context "Romans don't have 0" do

    # degenerate case
    it "converts 0 to a blank string" do
      expect(convert(0)).to eq("")
    end

    # 1st rule based case
    it "converts 1 to I" do
      expect(convert(1)).to eq("I")
    end

    # up to now it was simple.  here is when we make the first decision.  2 is too complex because it implies a vector or
    # array of 1's - i.e. 2 -> II  lets use something more simple, say, 5 -> V
    # another factor to move on is that fact that i can create this test by a simple copy, search and replace
      # this excentuates the fact that the test for 5 is a constant, just like 1.
    it "converts 5 to V" do
      expect(convert(5)).to eq("V")
    end
  end
end


# I = 1, V = 5, X=10, L = 50, D=500, M=1000
# http://literacy.kent.edu/Minigrants/Cinci/romanchart.htm
# based on Corey's convert kata here: http://blog.coreyhaines.com/2012/12/roman-numerals-kata-with-commentary.html

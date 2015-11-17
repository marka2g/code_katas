def convert(in_arabic)
  ""
end

describe "Converting arabic numbers to roman numerals" do

  context "Romans don't have 0" do

    # degenerate case - this bounds to the nothing or nil transformation from the transformation priority premise
    # right now i don't have anything, by focusing on the nothing case i can get my initial structure setup
    # so, i can setup how to test, what the method name is, etc.
    # TDD focuses on a very tight feedback loop; run tests as often as possible.
    it "converts 0 to a blank string" do
      expect(convert(0)).to eq("")
    end
  end
end


# I = 1, X=10, L = 50, D=500, M=1000
# http://literacy.kent.edu/Minigrants/Cinci/romanchart.htm
# based on Corey's convert kata here: http://blog.coreyhaines.com/2012/12/roman-numerals-kata-with-commentary.html

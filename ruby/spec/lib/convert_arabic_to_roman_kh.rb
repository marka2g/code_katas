def convert(in_arabic)
  return "" if in_arabic.zero?
  return "I" if in_arabic == 1
  "V"
end

describe "Converting arabic numbers to roman numerals" do

  context "Romans don't have 0" do
    # degenerate case
    it "converts 0 to a blank string" do
      expect(convert(0)).to eq("")
    end
  end

  # in the previous two tests, that fact that i can do a straight copy of 1 to 5 & I to V
  # shows me that there is some duplication here.  the duplication isn't really in the test case
  # as much as it in about the 'knowledge' about testing the rules. so, when talking about design, CH
  # falls back to the 4 rules about simple design. in this case, we see duplication about 'how to test' so,
  # lets eliminate that duplication right away. this allows us to extract out the 'what' we are testing from the 'how'
  # we are testing it. really drawing our attention to the rules of the algorithm, rather than having to sort thru
  # unneccesary noise to see them.
  {
    1 => "I",
    5 => "V"
  }.each_pair do |arabic, roman|
    it "converts #{arabic} to #{roman}" do
      expect(convert(arabic)).to eq(roman)
    end
  end
end


# I = 1, V = 5, X=10, L = 50, D=500, M=1000
# http://literacy.kent.edu/Minigrants/Cinci/romanchart.htm
# based on Corey's convert kata here: http://blog.coreyhaines.com/2012/12/roman-numerals-kata-with-commentary.html

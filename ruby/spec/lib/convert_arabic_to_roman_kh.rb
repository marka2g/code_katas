def convert(in_arabic)
  return "" if in_arabic.zero?
  return "I" if in_arabic == 1
  return "V" if in_arabic == 5
  # theres some duplication here which is actually gonna get us to the final algrithm. the II is actually made of 2 parts.
  # just like 2 is... the second "I" can be considered the same as converting the 1
  "I" + "I"
end

describe "Converting arabic numbers to roman numerals" do

  context "Romans don't have 0" do
    # degenerate case
    it "converts 0 to a blank string" do
      expect(convert(0)).to eq("")
    end
  end

  {
    1 => "I",
    5 => "V",
    2 => "II"
  }.each_pair do |arabic, roman|
    it "converts #{arabic} to #{roman}" do
      expect(convert(arabic)).to eq(roman)
    end
  end

  # now its time to bump up the complexity a bit. lets move up to something much more complicated than a constant, the II
  # 2 can be thought of as a vector or array of 1's.  according to the TPP, this is much more complex than a simple constant or even a scalar
  # we're gonna get this passing with our usual technique of guard clause + returning a constant. then we'll get into the refactoring phase which is where the
  # real excitement of this algorithm comes into play.

end


# I = 1, V = 5, X=10, L = 50, D=500, M=1000
# http://literacy.kent.edu/Minigrants/Cinci/romanchart.htm
# based on Corey's convert kata here: http://blog.coreyhaines.com/2012/12/roman-numerals-kata-with-commentary.html

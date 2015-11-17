# in some implementations that CH has seen, there's alot of effort put in to calculating the 4, the IV.  ...and thus the 9(IX) as offsets.  however,
# CH thinks that adds complexity to the algorith hides an important aspect of the roman numeral counting system.
# ** by keeping the the IV, IX, etc in our conversion chart, we provide a clear documantation of how roman numerals look.
# now since we are moving now to varification oriented tests, i wanna make sure that the important parts, the conversion list and the example list are readily accessible.
# adding more conversions to the list is going to drop the conversion list down the page, forcing me to scroll back and forth.  CH now splits his window to keep things ni sight.  by adding 6 -> VI, i wanna make sure that the recursion and the lookup work well together when i'm converting two diff types of numbers.  CH expects this to work out of the gate. 6 => "VI"
CONVERSION_FACTORS = [
  [5, "V"],
  [4, "IV"],
  [1, "I"]
]

def conversion_factors_for(in_arabic)
  CONVERSION_FACTORS.find {|arabic, _| arabic <= in_arabic}
end

def convert(in_arabic)
  return "" if in_arabic.zero?
  arabic, roman = conversion_factors_for(in_arabic)
  roman + convert(in_arabic - arabic)
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
    2 => "II",
    4 => "IV",
    5 => "V",
    6 => "VI"
  }.each_pair do |arabic, roman|
    it "converts #{arabic} to #{roman}" do
      expect(convert(arabic)).to eq(roman)
    end
  end
end


# I = 1, V = 5, X=10, L = 50, D=500, M=1000
# http://literacy.kent.edu/Minigrants/Cinci/romanchart.htm
# based on Corey's convert kata here: http://blog.coreyhaines.com/2012/12/roman-numerals-kata-with-commentary.html

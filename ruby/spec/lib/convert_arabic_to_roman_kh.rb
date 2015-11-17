CONVERSION_FACTORS = [
  [1000, "M"],
  [900, "CM"],
  [500, "D"],
  [400, "CD"],
  [100, "C"],
  [90, "XC"],
  [50, "L"],
  [40, "XL"],
  [10, "X"],
  [9, "IX"],
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
    6 => "VI",
    10 => "X",
    50 => "L",
    90 => "XC",
    100 => "C",
    500 => "D",
    1000 => "M",
    900 => "CM",
    3497 => "MMMCDXCVII"
  }.each_pair do |arabic, roman|
    it "converts #{arabic} to #{roman}" do
      expect(convert(arabic)).to eq(roman)
    end
  end
end


# I = 1, V = 5, X=10, L = 50, D=500, M=1000
# http://literacy.kent.edu/Minigrants/Cinci/romanchart.htm
# based on Corey's convert kata here: http://blog.coreyhaines.com/2012/12/roman-numerals-kata-with-commentary.html

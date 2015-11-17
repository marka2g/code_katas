RSpec.configure do |config|
  config.failure_color = :magenta
  config.pending_color = :white
  config.detail_color = :blue
  config.tty = true
  config.color = true
end

def convert(in_arabic)
end

describe "Converting arabic numbers to roman numerals" do
  context "Romans don't have a 0" do
    it "converts 0 to a blank string" do
      expect(convert(0)).to eq("")
    end
  end
end



# I = 1, X=10, L = 50, D=500, M=1000
# http://literacy.kent.edu/Minigrants/Cinci/romanchart.htm

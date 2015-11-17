def convert(in_arabic)
  return "" if in_arabic.zero?
  # return "V" if in_arabic == 5 # now we can delete line 3
  # the "I" and the 1 below are effectively representations of the same thing. perhaps we can think of them as conversion factors.
  # it makes sense to group them into a single entity there.
  #we are specifying the conversion factor is the same idea as line 3, just in a different format.
  # the order is important tho.  we'll have to be careful to grab the 5 in the right place and grab it when appropriate, thats
  # why we use the '<=' . because we wanna find the 5 when we have 5 but the 1 when we have 2 or 1.
  arabic, roman = [[5, "V"], [1, "I"]].find {|arabic, _| arabic <= in_arabic} #side note, '_' is used to explicitly tell us that lookup is not dependent on the second part of the array (roman equiv).
  # here we fall back on a technique we've seen before. introducing duplication in order to coax the algorithm into a simpler form.
  roman + convert(in_arabic - arabic)
  # to keep going, we add to the complexity of the algorithm by driving out some explicit duplication.
  # i.o.w - "I" is really the same thing as one of our return and gaurd statements return "I" if in_arabic == 1 contains the same knowledge of what we just
  # wrote on line 5. since 1 - 1 is 0, and the recursive call will yield an empty string. so, shifting the code the way we did allows us to delete line 3. test still passes
  # at each small incremental test, we are rerunning our test and varifying that they are green.  this has a couple benefits:
    # 1. we can see that we truely aren't changing any behavior.
    # 2. if we make a mistake, we can just undo our last change.  when refactoring, we should be keeping our tests green at each incremental step.

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

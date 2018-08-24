require 'rspec'
require_relative 'practice_test'
describe "my_rotate" do
  a = [ "a", "b", "c", "d" ]

  it "Rotates the elements 1 position if no argument is passed in" do
    expect(a.my_rotate).to eq(["b", "c", "d", "a"])
  end

  it "Rotates the elements correctly if an argument is passed in" do
    expect(a.my_rotate(2)).to eq(["c", "d", "a", "b"])
  end

  it "Rotates the elements correctly if a negative argument is passed in" do
    expect(a.my_rotate(-3)).to eq(["b", "c", "d", "a"])
  end

  it "Rotates the elements correctly for a large argument" do
    expect(a.my_rotate(15)).to eq(["d", "a", "b", "c"])
  end

end

describe "#two_sum" do
  it "returns positions of pairs of numbers that add to zero" do
    expect([5, 1, -7, -5].two_sum).to eq([[0, 3]])
  end

  it "finds multiple pairs" do
    expect([5, -1, -5, 1].two_sum).to eq([[0, 2], [1, 3]])
  end

  it "finds pairs with same element" do
    expect([5, -5, -5].two_sum).to eq([[0, 1], [0, 2]])
  end

  it "returns [] when no pair is found" do
    expect([5, 5, 3, 1].two_sum).to eq([])
  end

  it "won't find spurious zero pairs" do
    expect([0, 1, 2, 3].two_sum).to eq([])
  end

  it "will find real zero pairs" do
    expect([0, 1, 2, 0].two_sum).to eq([[0, 3]])
  end
end


describe "#primes" do

  it "returns first five primes in order" do
    expect(primes(5)).to eq([2, 3, 5, 7, 11])
  end

  it "returns an empty array when asked for zero primes" do
    expect(primes(0)).to eq([])
  end
end

describe "real_words_in_string" do
  it "finds a simple word" do
    words = "asdfcatqwer".real_words_in_string(["cat", "car"])
    expect(words).to eq(["cat"])
  end

  it "doesn't find words not in the dictionary" do
    words = "batcabtarbrat".real_words_in_string(["cat", "car"])
    expect(words).to be_empty
  end

  it "finds words within words" do
    dictionary = ["bears", "ear", "a", "army"]
    words = "erbearsweatmyajs".real_words_in_string(dictionary)
    expect(words).to match_array(["bears", "ear", "a"])
  end
end

describe "#caesar_cipher" do
  it "encodes a simple word" do
    expect(caesar_cipher("aaa", 11)).to eq("lll")
  end

  it "wraps around the alphabet" do
    expect(caesar_cipher("zzz", 1)).to eq("aaa")
  end

  it "encodes multiple words" do
    expect(caesar_cipher("catz hatz", 2)).to eq("ecvb jcvb")
  end
end

describe "titleize" do
  it "capitalizes a word" do
    expect(titleize("jaws")).to eq("Jaws")
  end

  it "capitalizes every word (aka title case)" do
    expect(titleize("david copperfield")).to eq("David Copperfield")
  end

  it "doesn't capitalize 'little words' in a title" do
    expect(titleize("war and peace")).to eq("War and Peace")
  end

  it "does capitalize 'little words' at the start of a title" do
    expect(titleize("the bridge over the river kwai")).to eq("The Bridge over the River Kwai")
  end
end


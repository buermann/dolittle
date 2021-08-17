require 'rails_helper'

describe PigLatin, type: :request do

  it "should shift the first consonants to the end of the word and append 'ay'" do
    PigLatin.piggify("butter").should   eq "utterbay"
    PigLatin.piggify("putter").should   eq "utterpay"
    PigLatin.piggify("clutter").should  eq "utterclay"
    PigLatin.piggify("stutter").should  eq "utterstay"
    PigLatin.piggify("splutter").should eq "uttersplay"
  end

  it "should add an 'ay' to the end of a word that begins with a vowel" do
    PigLatin.piggify("aardvark").should  eq "aardvarkay"
    PigLatin.piggify("enter").should     eq "enteray"
    PigLatin.piggify("interim").should   eq "interimay"
    PigLatin.piggify("orangutan").should eq "orangutanay"
    PigLatin.piggify("underdog").should  eq "underdogay"
  end


  it "should add a 'yay' if the last letter is a vowel" do
    PigLatin.piggify("abampere").should eq "abampereyay"
    PigLatin.piggify("eagle").should    eq "eagleyay"
    PigLatin.piggify("idea").should     eq "ideayay"
    PigLatin.piggify("othello").should  eq "othelloyay"
    PigLatin.piggify("umbrella").should eq "umbrellayay"
  end

  it "should preserve white space" do
    PigLatin.piggify("A screaming came  across the sky").should eq "Ayay eamingscray amecay  acrossay ethay yskay"
  end

  it "should conserve capitalization" do
    PigLatin.piggify("It was a queer summer when they electrocuted the Rosenbergs and I did not know what I was doing in New York").should eq "Itay asway ayay a ueerqay ummersay enwhay eythay electrocuteday the Osenbergsray anday Iyay idday otnay owknay atwhay Iyay asway oingday inay Ewnay Orkyay"
  end

  it "should conserve punctuation" do
    PigLatin.piggify("Mother died today. Or maybe, yesterday; I can't be sure.").should eq "Othermay iedday odaytay. Oray aybemay, esterdayyay; Iyay an'tcay ebay uresay."
  end

  it "should work in reverse" do
    PigLatin.anglify("Othermay iedday odaytay. Oray aybemay, esterdayyay; Iyay an'tcay ebay uresay.").should eq "Mother died today. Or maybe, yesterday; I can't be sure."
  end

  it "should autodetect which is which, making both methods idempotent" do
    PigLatin.piggify("Othermay iedday odaytay. Oray aybemay, esterdayyay; Iyay an'tcay ebay uresay.").should eq "Mother died today. Or maybe, yesterday; I can't be sure."
    PigLatin.anglify("Mother died today. Or maybe, yesterday; I can't be sure.").should eq "Othermay iedday odaytay. Oray aybemay, esterdayyay; Iyay an'tcay ebay uresay."
  end
end


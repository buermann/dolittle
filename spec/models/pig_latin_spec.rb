require 'rails_helper'

describe PigLatin, type: :request do

  it "should shift the first consonants to the end of the word and append 'ay'" do
    PigLatin.piggify("batter").should   eq "atterbay"
    PigLatin.piggify("peter").should    eq "eterbay"
    PigLatin.piggify("climber").should  eq "imberclay"
    PigLatin.piggify("prophet").should  eq "ophetpray"
    PigLatin.piggify("grumble").should  eq "umblegray"
  end

  it "should add an 'ay' to the end of a word that begins with a vowel" do
    PigLatin.piggify("aardvark").should  eq "aardvarkay"
    PigLatin.piggify("enter").should     eq "enteray"
    PigLatin.piggify("interim").should   eq "interimay"
    PigLatin.piggify("orangutan").should eq "orangutanay"
    PigLatin.piggify("underdog").should  eq "underdogay"
  end


  it "should add a 'yay' if the first and last letter are vowels" do
    PigLatin.piggify("abampere").should eq "abampereyay"
    PigLatin.piggify("eagle").should    eq "eagleyay"
    PigLatin.piggify("idea").should     eq "ideayay"
    PigLatin.piggify("othello").should  eq "othelloyay"
    PigLatin.piggify("umbrella").should eq "umbrellayay"
  end

  it "should conserve punctuation" do
    PigLatin.piggify("today.").should eq "odaytay."
    PigLatin.piggify("yesterday;").should eq "esterdayyay;"
    PigLatin.piggify("kleene?").should eq "eeneklay?"
    PigLatin.piggify("excelsior!").should eq "excelsioryay!"
    PigLatin.piggify("KARAMAZOV!!").should eq "ARAMAZOVKAY!!"
    PigLatin.piggify("which???").should eq "ichwhay???"
  end

  it "should translate complete phrases" do
    PigLatin.piggify("the best of both worlds once in a blue moon").should eq "ethay estbay ofay othbay orldsway onceyay inay ayay ueblay oonmay"
  end

  it "should conserve capitalization at the beginning of sentences and proper nouns" do
    PigLatin.piggify("It was a queer summer when they electrocuted the Rosenbergs and I did not know what I was doing in New York").should eq "Itay asway ayay a ueerqay ummersay enwhay eythay electrocuteday the Osenbergsray anday Iyay idday otnay owknay atwhay Iyay asway oingday inay Ewnay Orkyay"
  end

  it "should preserve the double-space stop of old typesettings" do
    PigLatin.piggify("Remember when there were two spaces between sentences.  I do.").should eq "Ememberray enwhay erethay otway acesyay etweenbay entencessay.  Iyay oday."
  end

  it "should preserve all white space formatting" do
    PigLatin.piggify("*******\n\n\n\tA screaming came across the sky.").should eq "*******\n\n\n\tAyay eamingscray amecay acrossay ethay skyay."
  end

  it "should work in reverse" do
    PigLatin.anglify("Stephen Cole Kleene is a hero of mine, but it's hard to tell if he makes my job easier, or harder.").should eq "Ephenstay Olecay Eeneklay isay ayay erohay ofay inemay, utbay it'say ardhay otay elltay ifay ehay akesmay myay objay easieray, oray arderhay."
  end

  it "should autodetect which is which, making both methods idempotent" do
    PigLatin.piggify("Othermay iedday odaytay. Oray aybemay, esterdayyay; Iyay an'tcay ebay uresay.").should eq "Mother died today. Or maybe, yesterday; I can't be sure."
    PigLatin.anglify("Mother died today. Or maybe, yesterday; I can't be sure.").should eq "Othermay iedday odaytay. Oray aybemay, esterdayyay; Iyay an'tcay ebay uresay."
  end
end


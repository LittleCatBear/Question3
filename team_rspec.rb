require 'rails_helper'
describe Team do
  let(:team) { Team.new }

  before(:each) {
    team << "paul"
    team << "pierre"
    team << "jacques"
  }

  context "#<<" do
    it "adds a new member" do
      team << "bob"
      expect(team.instance_variable_get("@members")[3]).to have_attributes(name: "bob")
    end
  end

  context "#members_names" do
    it "renders all team members names " do
      expect(team.members_names).to eq(["paul", "pierre", "jacques"])
    end
  end

  context "#pro_print" do
    it "print capitalized names" do
      expect{ team.pro_print }.to output("Paul\nPierre\nJacques\n").to_stdout
    end
    context "if given a specific number of names to display" do
      it "prints given number of names" do
        expect{ team.pro_print(2) }.to output("Paul\nPierre\n").to_stdout
      end
    end
  end

  context "#reverse_print" do
    it "prints reversed names in reversed order" do
      expect{ team.reverse_print }.to output("seuqcaj\nerreip\nluap\n").to_stdout
    end
  end

  context "#presentation_print" do
    context "when using reverse presentation option" do
      it "prints team members name in reverse order" do
        expect{ team.presentation_print("reverse") }.to output("Members:\n* jacques\n* pierre\n* paul\n").to_stdout
      end
    end

    context "when using several presentation option" do
       it "prints name using all the presentation options" do
        expect{ team.presentation_print("sort", "reverse") }.to output("Members:\n* pierre\n* paul\n* jacques\n").to_stdout
      end
    end
  end

  context "#funny_print" do
    it "prints 2 emoticons" do
      expect{ team.funny_print }.to output("\u{1F4DA}  paul \u{1F60E}\n\u{1F4DA}  pierre \u{1F60E}\n\u{1F4DA}  jacques \u{1F60E}\n").to_stdout
    end
  end
end

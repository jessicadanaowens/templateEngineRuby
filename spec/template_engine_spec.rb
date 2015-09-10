require 'spec_helper'
require './template_engine'

RSpec.describe TemplateEngine, "#compute" do

  it "finds matches" do
    data = {"name" => "Jessica", "place" => "hillsdale"}
    template = "%<name>% lives in %<place>%"

    template_engine = TemplateEngine.new(data, template)

    expect(template_engine.find_matches).to eq [["name"], ["place"]]
  end

  it"replaces the matches with appropriate data" do
    data = {name: "Jessica", place: "hillsdale"}
    template = "%<name>% lives in %<place>%"

    template_engine = TemplateEngine.new(data, template)
    template_engine.find_matches
    expect(template_engine.replace_matches_with_data).to eq "Jessica lives in hillsdale"
  end
end
require "./spec_helper"

describe BoardGenerator::Tasks::EnvCheck do
  it "exposes run" do
    BoardGenerator::Tasks::EnvCheck.responds_to?(:run).should be_true
  end
end

describe BoardGenerator::Tasks::GenerateBoard do
  it "exposes run" do
    BoardGenerator::Tasks::GenerateBoard.responds_to?(:run).should be_true
  end
end

describe BoardGenerator::Tasks::GenerateDocs do
  it "exposes run" do
    BoardGenerator::Tasks::GenerateDocs.responds_to?(:run).should be_true
  end
end

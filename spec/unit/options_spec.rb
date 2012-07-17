require 'rp/options'

describe Rp::Options do

  it 'stores the specified directory name' do
    arguments = ["myrubyproject"]

    options = Rp::Options.parse(arguments)

    options.directory_name = "myrubyproject"
  end

  it 'stores the specified ruby version' do
    arguments = ["-r", "ruby-1.9.2"]

    options = Rp::Options.parse(arguments)

    options.ruby_version.should == "ruby-1.9.2"
  end

end

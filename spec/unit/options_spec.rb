require 'spec_helper'
require 'rp/options'
require 'rp/version'

describe Rp::Options do

  let(:output) { StringIO.new }

  it 'stores the specified directory name' do
    arguments = ["myrubyproject"]

    options = Rp::Options.parse(arguments)

    options.directory_name.should == "myrubyproject"
  end

  it 'stores the specified ruby version' do
    arguments = ["-r", "ruby-1.9.2"]

    options = Rp::Options.parse(arguments)

    options.ruby_version.should == "ruby-1.9.2"
  end

  it 'put help message to output if no argumens given' do
    arguments = []

    Rp::Options.should_receive(:exit)

    capture(:stdout) {
      Rp::Options.parse(arguments)
    }.split("\n").should == ["Usage: rp [NAME] ... [OPTION] ...",
                             "",
                             "Specific options:",
                             "    -r, --ruby-version [VERSION]     ruby version used in .rvmrc file",
                             "    -h, --help                       display this help and exit",
                             "    -v, --version                    show version"]
  end

  it 'put version information to the outout' do
    Rp.stub(:VERSION => "0.0.1")

    arguments = ["-v"]

    Rp::Options.should_receive(:exit)

    capture(:stdout) { Rp::Options.parse(arguments) }.should == "rp, version 0.0.1\n"
  end

end

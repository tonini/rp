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

  it 'put help message to output if no argumens given' do
    arguments = []
    output = StringIO.new

    Rp::Options.should_receive(:exit)

    options = Rp::Options.parse(arguments, output)

    output.rewind
    output.readlines.should == ["Usage: rp [NAME] ... [OPTION] ...\n",
                                "\n",
                                "Specific options:\n",
                                "    -r, --ruby-version [VERSION]     ruby version used in .rvmrc file\n",
                                "    -h, --help                       display this help and exit\n"]
  end

end

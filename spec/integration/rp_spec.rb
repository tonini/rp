require 'integration/spec_helper'

describe 'Ruby-Project Directory Generator' do

  let(:directory_name) { 'example_dir' }

  it 'Creates a new directory with a specified rvmrc file in it' do
    output = StringIO.new
    rp = Rp::Projector.new(directory_name)
    rp.build(output)

    output.rewind
    output.readlines.should == ["      create  example_dir/.rvmrc\n",
                                "      create  example_dir/ruby.rb\n",
                                "Built empty ruby enviroment in #{directory_name}\n"]
  end

  after { FileUtils.rm_r(directory_name) }

end

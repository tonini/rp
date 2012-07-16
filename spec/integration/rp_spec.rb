require 'integration/spec_helper'

describe 'Ruby-Project Directory Generator' do

  let(:directory_name) { 'example_dir' }

  it 'Creates a new directory with a specified rvmrc file in it' do
    output = StringIO.new
    rp = Rp::Project.new(directory_name)
    rp.create(output)

    output.rewind
    output.readlines.should == ["      create  example_dir/ruby.rb\n",
                                "      create  example_dir/.rvmrc\n",
                                "Built empty ruby enviroment in #{directory_name}\n"]
  end

  after { FileUtils.rm_r(directory_name) }

end

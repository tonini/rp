require 'spec_helper'
require 'integration/spec_helper'

describe 'Ruby-Project Directory Generator' do

  let(:directory_name) { 'example_dir' }

  it 'Creates a new directory with a specified rvmrc file in it' do
    rp = Rp::Projector.new(directory_name)

    rp.stub(:destination_full_path => directory_name)

    capture(:stdout) { rp.build }.split("\n").should == ["\e[32m      create\e[0m  example_dir/ruby.rb",
                                                         "\e[32m      create\e[0m  example_dir/.rvmrc",
                                                         "Built new ruby enviroment in #{directory_name}"]
  end

  after { FileUtils.rm_r(directory_name) }

end

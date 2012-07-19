require 'spec_helper'
require 'rp/shell_helper'
require 'rp/resource'
require 'rp/color'
require 'rp/file'

describe Rp::ShellHelper do

  let(:shell_example_class) do
    class ShellExampleClass
      include Rp::ShellHelper
    end.new
  end


  describe ".say_status" do

    it 'prints a status message to the output' do
      destination = 'prototype/.rvmrc'

      capture(:stdout) {
        shell_example_class.say_status(:created, destination)
      }.should == "     created  prototype/.rvmrc\n"
    end

  end

end

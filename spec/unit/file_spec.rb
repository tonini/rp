require 'spec_helper'
require 'rp/color'
require 'rp/file'

describe Rp::File do

  describe ".say_status" do

    it 'prints a status message to the output' do
      destination = 'prototype/.rvmrc'

      capture(:stdout) {
        Rp::File.say_status(:created, destination)
      }.should == "     created  prototype/.rvmrc\n"
    end

  end

end

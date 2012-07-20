require 'spec_helper'
require 'rp/shell_helper'
require 'rp/resource'
require 'rp/color'
require 'rp/file'

describe Rp::File do

  let(:directory_name) { 'prototype' }
  let(:file_name) { 'prototype/.rvmrc' }

  describe "file already exists" do
    before do
      ::FileUtils.mkdir_p(directory_name)
      ::File.open(file_name, 'w+')
    end


    it "won't create file it is identical" do
      capture(:stdout) {
        Rp::File.new(file_name)
      }.should == "\e[34m   identical\e[0m  prototype/.rvmrc\n"
    end

    context 'file content is diffrent' do
      it 'ask for next steps'
    end
  end

  after { FileUtils.rm_r(directory_name) }

end

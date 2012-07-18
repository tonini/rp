require 'rp/color'
require 'rp/file'

describe Rp::File do

  let(:output) { StringIO.new }
  let(:directory_name) { 'prototype' }

  before { FileUtils.mkdir_p(directory_name) }

  it 'already an identical file exists' do
    File.new(File.join(directory_name, '.rvmrc'), "w+")

    Rp::File.create('.rvmrc', '', directory_name, output)

    output.rewind
    output.readlines.should == ["   \e[34midentical\e[0m  prototype/.rvmrc\n"]
  end

  after { FileUtils.rm_r(directory_name) }

end

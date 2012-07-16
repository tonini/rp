require 'rp/file'
require 'rp/directory'
require 'rp/projector'

describe Rp::Projector do

  let(:directory_name) { 'prototype' }
  let(:output) { StringIO.new }

  before do
    projector = Rp::Projector.new(directory_name)
    projector.build(output)
  end

  it 'creates a directory with the give name' do
    File.directory?(directory_name).should be_true
  end

  describe '.rvmrc File creation' do
    it 'creates a .rvmrc file in the project directory' do
      File.exists?(File.join(directory_name, '.rvmrc')).should be_true
    end

    context 'without a specified ruby version' do
      it 'writes a rvm command in the .rvmrc file to use or build a gemset' do
        readlines = File.open(File.join(directory_name, '.rvmrc')).readlines
        readlines.should == ["rvm --create ruby-1.9.3@prototype\n"]
      end
    end

    context 'with a specified ruby version' do
      before do
        FileUtils.rm_r(directory_name)

        output = StringIO.new
        project = Rp::Projector.new(directory_name, {:ruby_version => 'ruby-1.9.3-p125'})

        project.build(output)
      end

      it 'writes a rvm command in the .rvmrc file to use or build a gemset' do
        readlines = File.open(File.join(directory_name, '.rvmrc')).readlines
        readlines.should == ["rvm --create ruby-1.9.3-p125@prototype\n"]
      end
    end
  end

  it 'creates a default ruby.rb file' do
    File.exists?(File.join(directory_name, 'ruby.rb')).should be_true
  end

  after { FileUtils.rm_r(directory_name) }

end

require 'rp/project'

describe Rp::Project do

  let(:directory_name) { 'prototype' }

  before do
    output = StringIO.new
    project = Rp::Project.new(directory_name)
    project.create(output)
  end

  it 'creates a directory with the give name' do
    File.directory?(directory_name).should be_true
  end

  describe '.rvmrc File creation' do
    it 'creates a .rvmrc file in the project directory' do
      File.exists?(File.join(directory_name, '.rvmrc')).should be_true
    end

    it 'prints a rvm command in the .rvmrc file to use or build a gemset' do
      readlines = File.open(File.join(directory_name, '.rvmrc')).readlines
      readlines.should == ["rvm --create ruby-1.9.3@prototype\n"]
    end
  end

  it 'creates a default ruby.rb file' do
    File.exists?(File.join(directory_name, 'ruby.rb')).should be_true
  end

  after { FileUtils.rm_r(directory_name) }

end

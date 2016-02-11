#
# Cookbook Name:: aws
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'chef_spec'

describe 'eventstore::queryapi' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04')
    end
	it "should have default install_method 'package'" do
	  chef_run.converge(described_recipe)
	end
    
  end
end

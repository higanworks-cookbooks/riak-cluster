#
# Cookbook Name:: riak-cluster
# Recipe:: default
#
# Copyright 2012, HiganWorks LLC
#
# license: MIT

store_dir = "#{Chef::Config[:file_cache_path]}/riak"

# todo Attributes
# http://downloads.basho.com.s3-website-us-east-1.amazonaws.com/riak/1.2/1.2.0/ubuntu/precise/riak_1.2.0-1_amd64.deb
riak_ = "/1.2/1.2.0/ubuntu/precise/riak_1.2.0-1_amd64.deb"


directory store_dir do
  mode 00700
end

remote_file "#{store_dir}/riak_1.2.0-1_amd64.deb" do
  source "http://downloads.basho.com.s3-website-us-east-1.amazonaws.com/riak/1.2/1.2.0/ubuntu/precise/riak_1.2.0-1_amd64.deb"
  action :create_if_missing
end

package "riak_1.2.0-1_amd64.deb" do
  Chef::Provider::Package::Dpkg
  source "#{store_dir}/riak_1.2.0-1_amd64.deb"
  action :install
end

#
# Cookbook Name:: simple_patcher
# Recipe:: default
#
# Copyright 2016 Nick Rycar
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apt_update 'all platforms' do
  action :update
end

patch_list = data_bag_item(node['simple_patcher']['data_bag_name'], 
                           node['simple_patcher']['data_bag_item_name'])

patch_list['package'].each do |package_name, package_version|
  package "#{package_name}" do
    version "#{package_version}"
  end
end
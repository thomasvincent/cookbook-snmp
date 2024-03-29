# Cookbook Name:: snmp
# Recipe:: snmptrapd
#
# Copyright 2013, Eric G. Wolfe
# Copyright 2023, Thomas Vincent
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

# Configure SNMPD to run snmptrapd
node.default['snmp']['snmpd']['trapd_run'] = 'yes'

# Install SNMPD
include_recipe 'snmp::default'

# Configure and enable snmptrapd
service node['snmp']['snmptrapd']['service'] do
  action [:enable, :start]
end

# Configure snmptrapd
template '/etc/snmp/snmptrapd.conf' do
  mode '0644'
  owner 'root'
  group 'root'
  notifies :restart, "service[#{node['snmp']['snmptrapd']['service']}]"
end

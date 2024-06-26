# Cookbook Name:: snmp
# Attributes:: snmptrapd
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

# Default snmptrapd service name setup
default['snmp']['snmptrapd']['service_name'] = if node['platform_family'] == 'rhel'
                                                 'snmptrapd'
                                               else
                                                 node['snmp']['service_name']
                                               end

# Common snmptrapd options
default['snmp']['snmptrapd']['traphandle'] = 'default /usr/sbin/snmptthandler'
default['snmp']['snmptrapd']['disable_authorization'] = 'yes'
default['snmp']['snmptrapd']['do_not_log_traps'] = 'yes'

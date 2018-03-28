#
# Cookbook:: push-jobs-wrapper
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

case node['platform']
when 'redhat', 'centos'
  if node['platform_version'].to_i == 5
    node.default['push_jobs']['package_url'] = "http://ubuntu.myreposrv.com/link/push-jobs-client-2.4.5-1.el5.x86_64.rpm"
    node.default['push_jobs']['package_checksum'] =  "956cc1ecaab3950242ae5343ca066a50c6fdf4520bbc74b7d266038c50adfc3f"
  elsif node['platform_version'].to_i == 6
    node.default['push_jobs']['package_url'] = " https://packages.chef.io/files/stable/push-jobs-client/2.4.8/el/6/push-jobs-client-2.4.8-1.el6.x86_64.rpm"
    node.default['push_jobs']['package_checksum'] =  "956cc1ecaab3950242ae5343ca066a50c6fdf4520bbc74b7d266038c50adfc3f"
  elsif node['platform_version'].to_i == 7
    node.default['push_jobs']['package_url'] = "https://packages.chef.io/files/stable/push-jobs-client/2.4.8/el/7/push-jobs-client-2.4.8-1.el7.x86_64.rpm"
    node.default['push_jobs']['package_checksum'] =  "681907fc4dc43211d15053cd6ae80213427ebec07acf21699995f8435867305a"
  end

when 'ubuntu'
  if node['platform_version'] == "16.04"
    node.default['push_jobs']['package_url'] = "http://ubuntu.myreposrv.com/link/push-jobs-client_2.4.5-1_amd64.deb"
    node.default['push_jobs']['package_checksum'] =  "7fd34af01792b55e5c80094945cee1cae9baeccd38bda2c8933a5607576b1711"
  elsif node['platform_version'] == "14.04"
    node.default['push_jobs']['package_url'] = "http://ubuntu.myreposrv.com/link/push-jobs-client_2.4.5-1_amd64.deb"
    node.default['push_jobs']['package_checksum'] =  "7fd34af01792b55e5c80094945cee1cae9baeccd38bda2c8933a5607576b1711"
  end

when 'suse'
  node.default['push_jobs']['package_url'] = "http://ubuntu.myreposrv.com/link/push-jobs-client-2.4.5-1.el7.x86_64.rpm"
  node.default['push_jobs']['package_checksum'] =  "1721365de4cfa38bd1ca7744d5354b69ca6978eeaf80e6b09fc3bf375e1d5f83"

end

default['push_jobs']['whitelist'] = { 'chef-client' => 'chef-client' ,
                                      'execute-rhel-patch-role' => 'chef-client -o role[patch_scan_rhel_centos_ubuntu]',
                                      'execute-ubuntu-patch-role' => 'chef-client -o role[patch_scan_rhel_centos_ubuntu]',
                                      'execute-centos-patch-role' => 'chef-client -o role[patch_scan_rhel_centos_ubuntu]',
                                      'execute-suse-patch-role' => 'chef-client -o role[patch_scan_suse]',
                                      'execute-patch-role' =>  'chef-client -o role[patch]',
                                      'execute-centos6-compliance-role' => 'chef-client -o role[centos6_compliance]',
                                      'execute-centos7-compliance-role' => 'chef-client -o role[centos7_compliance]',
                                      'execute-redhat6-compliance-role' => 'chef-client -o role[redhat6_compliance]',
                                      'execute-redhat7-compliance-role' => 'chef-client -o role[redhat7_compliance]',
                                      'execute-suse11-compliance-role' => 'chef-client -o role[suse11_compliance]',
                                      'execute-suse12-compliance-role' => 'chef-client -o role[suse12_compliance]',
                                      'execute-ubuntu1404-compliance-role' => 'chef-client -o role[ubuntu1404_compliance]',
                                      'execute-ubuntu1604-compliance-role' => 'chef-client -o role[ubuntu1604_compliance]'
                                    }

include_recipe 'push-jobs'

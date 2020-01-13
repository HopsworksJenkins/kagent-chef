action :add do 

    # Make sure the directory exists before writing the template 
    directory node["install"]["sudoers"]["scripts_dir"] do
        owner 'root'
        group 'root'
        mode '0700'
        action :create
    end

    template "#{node["install"]["sudoers"]["scripts_dir"]}/#{new_resource.script_name}" do
        source new_resource.template
        owner  'root'
        group  'root'
        mode   '0700'
        action :create
    end

    sudo new_resource.name do 
        command     "#{node["install"]["sudoers"]["scripts_dir"]}/#{new_resource.script_name}"
        users       new_resource.user
        runas       new_resource.run_as
        only_if     { node["install"]["sudoers"]["rules"].casecmp("true") == 0 }
    end 
end
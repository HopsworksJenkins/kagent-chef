actions :add

attribute :name, :kind_of => String, :name_attribute => true, :required => true 

attribute :user, :kind_of => String
attribute :run_as, :kind_of => String

attribute :script_name, :kind_of => String
attribute :template, :kind_of => String
attribute :variables, :kind_of => Hash
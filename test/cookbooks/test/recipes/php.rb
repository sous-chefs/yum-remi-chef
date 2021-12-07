shortver = node['remi-test']['version'].delete('.')

# programatically define resource as to not have
# several almost-identical test recipes
declare_resource(:"yum_remi_php#{shortver}", 'default')

# will install from remi module
package 'php'

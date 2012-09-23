require 'ohai'
require 'json'
require 'yaml'
require 'time'

Ohai::Config[:plugin_path] << File.dirname(__FILE__) + '/ohai/plugins'

module DpkgInv

    def self.run
        puts JSON.pretty_generate(inventory)
    end

    def self.inventory
        o = Ohai::System.new

        # ohai has dozens of plugins; let's only load the ones we need...
        o.require_plugin('linux/lsb')
        o.require_plugin('linux/hostname')
        o.require_plugin('kernel')
        o.require_plugin('dpkg')

        json = {
            :fqdn   =>  o[:fqdn],
            :lsb     =>  {
                :id             =>  o[:lsb][:id],
                :release        =>  o[:lsb][:release],
                :codename       =>  o[:lsb][:codename],
                :description    =>  o[:lsb][:description]
            },
            :kernel =>  {
                :release    =>  o[:kernel][:release],
                :machine    =>  o[:kernel][:machine]
            },
            :dpkg   =>  o[:dpkg],
            :created_at => Time.now.iso8601
        }

        #
        # load system_id from external file,  but it's not required if you
        # just want a JSON representation of your packages.  it can be set by
        # config management, etc.
        #
        config_file = '/etc/dpkginv.conf'
        if File.exists?(config_file)
            config = YAML.load_file(config_file)
            unless config == false || config['system_id'].nil?
                json[:system_id] = config['system_id']
            end
        end

        return json
    end
end

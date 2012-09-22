#
# Debian/Ubuntu dpkg plugin for Chef's Ohai
#

provides "dpkg"

dpkg Mash.new

popen4("dpkg-query -W -f '${Status}|${Package}|${Version}|${Architecture}\n'") do |pid, stdin, stdout, stderr|
    stdout.each do |line|
        #
        # example dpkg output:
        #       install ok installed|manpages|3.35-0.1ubuntu1|all
        #

        line.chomp
        selection_status, null, install_status, name, version, arch = line.split(%r{\||\s})

        dpkg[name] = Mash.new
        dpkg[name][:selection_status] = selection_status
        dpkg[name][:install_status] = install_status
        dpkg[name][:version] = version.to_s
        dpkg[name][:arch] = arch
    end
end

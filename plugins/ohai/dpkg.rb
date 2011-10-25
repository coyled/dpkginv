#
# Debian/Ubuntu dpkg plugin for Chef's Ohai
#

provides "dpkg"

dpkg Mash.new

popen4("dpkg-query -W -f '${Status}|${Package}|${Version}|${Architecture}\n'") do |pid, stdin, stdout, stderr|
    stdout.each do |line|
        output = line.split('|')
        name = output[1]
        dpkg[name] = Mash.new
        dpkg[name][:selection_status], null, dpkg[name][:install_status] = output[0].split
        dpkg[name][:version] = output[2].to_s
        dpkg[name][:arch] = output[3].chomp
    end
end

require 'rake'
Gem::Specification.new do |s|
    s.name          = 'dpkginv'
    s.version       = '0.1.0'
    s.summary       = 'Debian/Ubuntu package inventory tools'
    s.description   = 'Read Debian/Ubuntu package inventory, emit as JSON'
    s.authors       = ['Dave Coyle']
    s.email         = 'hello@coyled.com'
    s.homepage      = 'https://github.com/coyled/dpkginv'
    s.license       = 'MIT'
    s.files         = `git ls-files`.split("\n")
    s.test_files    = `git ls-files -- test/*`.split("\n")
    s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

    s.add_runtime_dependency    'ohai', '~> 6.14'
end

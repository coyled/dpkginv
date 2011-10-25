require 'rake'
Gem::Specification.new do |s|
    s.name          = 'dpkginv'
    s.version       = '0.1.0.pre.1'
    s.summary       = 'Debian/Ubuntu package inventory tools'
    s.description   = 'Pre-release; don\'t use this yet.'
    s.authors       = ['Dave Coyle']
    s.email         = 'hello@coyled.com'
    s.homepage      = 'http://coyled.com/dpkginv'
    s.license       = 'MIT'
    s.files         = FileList[
                        'bin/dpkginv',
                        'plugins/ohai/*'
                      ].to_a
    s.bindir        = 'bin'
    s.executables   << 'dpkginv'
    s.add_runtime_dependency    'ohai', '~> 0.6'
end

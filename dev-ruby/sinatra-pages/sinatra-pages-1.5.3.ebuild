# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    A Sinatra extension for static pages rendering using the HAML rendering engine"
HOMEPAGE="http://github.com/rock-n-code/sinatra-pages"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.0.0"
ruby_add_rdepend ">=dev-ruby/tilt-1.1.0"
ruby_add_rdepend ">=dev-ruby/haml-3.0.21"
ruby_add_rdepend ">=dev-ruby/rspec-1.3.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5.6"


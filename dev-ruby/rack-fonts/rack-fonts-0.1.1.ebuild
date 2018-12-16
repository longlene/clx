# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Wraps Rack::Static by adding useful headers to serve web fonts"
HOMEPAGE="http://github.com/raul/rack-assets"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.2.3"
ruby_add_rdepend ">dev-ruby/minitest-2.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6.0"


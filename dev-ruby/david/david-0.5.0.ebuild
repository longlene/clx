# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="David is a CoAP server with Rack interface to bring the
    illustrious family of Rack compatible web frameworks into the Internet of
    Things"
HOMEPAGE="https://github.com/nning/david"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/celluloid-0.17.3"
ruby_add_rdepend ">=dev-ruby/celluloid-io-0.17.3"
ruby_add_rdepend ">=dev-ruby/coap-0.1"
ruby_add_rdepend ">=dev-ruby/rack-2.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"


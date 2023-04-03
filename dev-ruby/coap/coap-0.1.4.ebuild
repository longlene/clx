# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pure Ruby implementation of RFC 7252 (Constrained Application Protocol (CoAP))"
HOMEPAGE="https://github.com/nning/coap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/coveralls-0.7"
ruby_add_rdepend ">=dev-ruby/faker-1.4"
ruby_add_rdepend ">=dev-ruby/minitest-5.4"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/celluloid-io-0.17.3"
ruby_add_rdepend ">=dev-ruby/resolv-ipv6favor-0"


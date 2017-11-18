# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="		Async::DNS provides a high-performance DNS client resolver and server
		which can be easily integrated into other projects or used as a stand-alone
		daemon"
HOMEPAGE="https://github.com/async/async-dns"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/async-io-1.0"
ruby_add_rdepend ">=dev-ruby/async-rspec-1.0"
ruby_add_rdepend ">=dev-ruby/process-daemon-1.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rspec-3.6"
ruby_add_rdepend ">=dev-ruby/rake-0"


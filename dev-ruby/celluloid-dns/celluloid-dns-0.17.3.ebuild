# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="		Celluloid::DNS provides a high-performance DNS client resolver and server
		which can be easily integrated into other projects or used as a stand-alone
		daemon"
HOMEPAGE="https://github.com/celluloid/celluloid-dns"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/celluloid-0.17.3"
ruby_add_rdepend ">=dev-ruby/celluloid-io-0.17.3"
ruby_add_rdepend ">=dev-ruby/timers-4.1.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/process-daemon-1.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.4.0"
ruby_add_rdepend ">=dev-ruby/rake-0"


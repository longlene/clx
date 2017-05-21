# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A small, fast, evented, actor-based, highly customizable Ruby IMAP server"
HOMEPAGE="https://github.com/celluloid/celluloid-imap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/celluloid-io-0.17.3"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/nenv-0"
ruby_add_rdepend ">=dev-ruby/dotenv-0"
ruby_add_rdepend ">=dev-ruby/benchmark_suite-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0"
ruby_add_rdepend ">=dev-ruby/transpec-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend "=dev-ruby/listen-3.0.3"
ruby_add_rdepend "=dev-ruby/guard-2.13.0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/rspec-retry-0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/celluloid-0.17.2"
ruby_add_rdepend ">=dev-ruby/celluloid-essentials-0"
ruby_add_rdepend ">=dev-ruby/celluloid-supervision-0"
ruby_add_rdepend ">=dev-ruby/celluloid-pool-0"
ruby_add_rdepend ">=dev-ruby/celluloid-fsm-0"
ruby_add_rdepend ">=dev-ruby/celluloid-extras-0"
ruby_add_rdepend ">=dev-ruby/timers-4.1.1"


# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="		Async provides a modern asynchronous I/O framework for Ruby, based
		on nio4r"
HOMEPAGE="https://github.com/socketry/async"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nio4r-0"
ruby_add_rdepend ">=dev-ruby/timers-4.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/process-daemon-1.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.4.0"
ruby_add_rdepend ">=dev-ruby/rake-0"


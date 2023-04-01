# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="		Provides containers for servers which provide concurrency policies, e"
HOMEPAGE="https://github.com/socketry/async-container"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/async-1.0"
ruby_add_rdepend ">=dev-ruby/async-io-1.4"
ruby_add_rdepend ">=dev-ruby/async-rspec-1.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rspec-3.6"
ruby_add_rdepend ">=dev-ruby/rake-0"


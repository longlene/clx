# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A rack middleware for throttling and blocking abusive requests"
HOMEPAGE="http://github.com/kickstarter/rack-attack"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/minitest-stub-const-0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/appraisal-0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">=dev-ruby/actionpack-3.0.0"
ruby_add_rdepend ">=dev-ruby/redis-activesupport-0"
ruby_add_rdepend ">=dev-ruby/dalli-0"
ruby_add_rdepend ">=dev-ruby/connection_pool-0"
ruby_add_rdepend ">=dev-ruby/memcache-client-0"
ruby_add_rdepend ">=dev-ruby/timecop-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/guard-minitest-0"
ruby_add_rdepend ">=dev-ruby/guard-0"
ruby_add_rdepend ">=dev-ruby/byebug-0"


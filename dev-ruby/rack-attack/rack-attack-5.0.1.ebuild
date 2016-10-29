# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A rack middleware for throttling and blocking abusive requests"
HOMEPAGE="http://github.com/kickstarter/rack-attack"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/appraisal-0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">=dev-ruby/actionpack-3.0.0"
ruby_add_rdepend ">=dev-ruby/redis-activesupport-0"
ruby_add_rdepend ">=dev-ruby/dalli-0"
ruby_add_rdepend ">=dev-ruby/connection_pool-0"
ruby_add_rdepend ">=dev-ruby/memcache-client-0"


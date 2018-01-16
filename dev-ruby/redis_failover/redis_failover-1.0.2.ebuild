# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="redis_failover is a ZooKeeper-based automatic master/slave failover solution for Ruby"
HOMEPAGE="http://github.com/ryanlecompte/redis_failover"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redis-2.2"
ruby_add_rdepend ">=dev-ruby/redis-namespace-0"
ruby_add_rdepend ">=dev-ruby/multi_json-1"
ruby_add_rdepend ">=dev-ruby/zk-1.7.4"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/yard-0"


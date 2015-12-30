# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="DataMapper adapter for the Redis key-value database"
HOMEPAGE="http://github.com/whoahbot/dm-redis-adapter"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/dm-core-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-validations-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-types-1.2.0"
ruby_add_rdepend ">=dev-ruby/redis-3.0.4"
ruby_add_rdepend ">=dev-ruby/hiredis-0.4.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0.3"
ruby_add_rdepend ">=dev-ruby/jeweler-1.4.0"


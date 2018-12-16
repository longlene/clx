# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Enable to zip keys, zip values and replace simple storage key/value pairs with hash storing"
HOMEPAGE="https://github.com/alekseyl/me-redis"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redis-3.0"
ruby_add_rdepend ">=dev-ruby/base62-rb-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.16"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/minitest-0"


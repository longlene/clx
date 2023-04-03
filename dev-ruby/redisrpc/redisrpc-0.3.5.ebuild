# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RedisRPC is the easiest to use RPC library in the world"
HOMEPAGE="http://github.com/nfarring/redisrpc"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "<dev-ruby/redis-3.0.0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.3"


# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

inherit ruby-fakegem

DESCRIPTION="Recommendify is a distributed, incremental item-based recommendation engine for binary input ratings. It's based on ruby and redis and uses an approach called \"Collaborative Filtering\""
HOMEPAGE="http://github.com/paulasmuth/recommendify"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redis-2.2.2"


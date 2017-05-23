# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

inherit ruby-fakegem

DESCRIPTION="High performance real-time search (Support Chinese), indexes store in Redis for Rails applications. "
HOMEPAGE="http://github.com/huacnlee/redis-search"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redis-3.0.0"
ruby_add_rdepend ">=dev-ruby/redis-namespace-1.3.0"
ruby_add_rdepend ">=dev-ruby/ruby-pinyin-0.3.0"


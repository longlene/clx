# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

inherit ruby-fakegem

DESCRIPTION="A Like/Dislike recommendation engine for Ruby apps using Redis.
"
HOMEPAGE="https://github.com/davidcelis/recommendable"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">=dev-ruby/hooks-0.2.1"
ruby_add_rdepend ">=dev-ruby/redis-2.2.0"


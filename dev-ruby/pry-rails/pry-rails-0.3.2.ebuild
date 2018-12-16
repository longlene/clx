# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

inherit ruby-fakegem

DESCRIPTION="Use Pry as your rails console"
HOMEPAGE="https://github.com/rweng/pry-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pry-0.9.10"


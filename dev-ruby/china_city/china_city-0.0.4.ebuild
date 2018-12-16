# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

inherit ruby-fakegem

DESCRIPTION="a gem to help you select chinese area like province, city and district"
HOMEPAGE="https://github.com/saberma/china_city"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jquery-rails-0"
ruby_add_rdepend ">=dev-ruby/rails-3.1.0"


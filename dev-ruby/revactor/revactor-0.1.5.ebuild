# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

inherit ruby-fakegem

DESCRIPTION="Revactor is an Actor implementation for writing high performance concurrent programs"
HOMEPAGE="http://revactor.org"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/case-0.4"
ruby_add_rdepend ">=dev-ruby/rev-0.3.1"


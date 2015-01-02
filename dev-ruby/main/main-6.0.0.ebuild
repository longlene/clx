# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

inherit ruby-fakegem

DESCRIPTION="a class factory and dsl for generating command line programs real quick"
HOMEPAGE="https://github.com/ahoward/main"

LICENSE="same as ruby's"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/arrayfields-4.7.4"
ruby_add_rdepend ">=dev-ruby/chronic-0.6.2"
ruby_add_rdepend ">=dev-ruby/fattr-2.2.0"
ruby_add_rdepend ">=dev-ruby/map-5.1.0"


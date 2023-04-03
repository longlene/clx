# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

inherit ruby-fakegem

DESCRIPTION=" Treat is a natural language processing framework for Ruby. "
HOMEPAGE="https://github.com/louismullie/treat"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/birch-0"
ruby_add_rdepend ">=dev-ruby/schiphol-0"
ruby_add_rdepend ">=dev-ruby/yomu-0"


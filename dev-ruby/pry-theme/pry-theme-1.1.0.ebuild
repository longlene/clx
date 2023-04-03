# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

inherit ruby-fakegem

DESCRIPTION="The plugin enables color theme support for Pry."
HOMEPAGE="https://github.com/kyrylo/pry-theme"

LICENSE="zlib"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/coderay-1.1"
ruby_add_rdepend ">=dev-ruby/json-1.8"


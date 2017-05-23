# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

inherit ruby-fakegem

DESCRIPTION="Releasy helps to make Ruby application releases simpler"
HOMEPAGE="http://spooner.github.com/libraries/releasy/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cri-2.1.0"
ruby_add_rdepend ">=dev-ruby/net-github-upload-0.0.8"
ruby_add_rdepend ">=dev-ruby/ocra-1.3.0"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2.2"
ruby_add_rdepend ">=dev-ruby/thor-0.14.6"


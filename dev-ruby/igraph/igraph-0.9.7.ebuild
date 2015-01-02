# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

inherit ruby-fakegem

DESCRIPTION="IGraph is a Ruby extension for interfacing with the C igraph library"
HOMEPAGE="http://igraph.rubyforge.org/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "dev-libs/igraph"

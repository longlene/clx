# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit multilib

DESCRIPTION="mruby is the lightweight implementation of the Ruby language complying to (part of) the ISO standard."
HOMEPAGE="https://github.com/mruby/mruby"
SRC_URI="mirror://github/mruby/mruby/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sys-devel/bison
	dev-lang/ruby"

src_install() {
	dobin bin/{mirb,mrbc,mrdb,mruby}
	dolib.a build/host/lib/{libmruby.a,libmruby_core.a}

	insinto /usr/include/
	doins -r include/{mrbconf.h,mruby,mruby.h}
	dodoc -r doc/guides
}

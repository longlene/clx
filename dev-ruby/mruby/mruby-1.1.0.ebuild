# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit multilib flag-o-matic

DESCRIPTION="mruby is the lightweight implementation of the Ruby language complying to (part of) the ISO standard."
HOMEPAGE="https://github.com/mruby/mruby"
SRC_URI="https://github.com/mruby/mruby/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
sys-devel/bison
dev-lang/ruby
sys-libs/libtermcap-compat"

pkg_pretend() {
	if test-flag-CC -std=c99; then
		append-cflags -std=c99
	else
		die "C99 not supported by currently used C compiler"
	fi
}

src_install() {
	dobin bin/{mirb,mrbc,mruby}
	dolib.a build/host/lib/{libmruby.a,libmruby_core.a}

	insinto /usr/include/
	doins -r include/{mrbconf.h,mruby,mruby.h}
}

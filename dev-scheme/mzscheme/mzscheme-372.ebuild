# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic

DESCRIPTION="MzScheme scheme compiler"
HOMEPAGE="http://www.plt-scheme.org/software/mzscheme/"
SRC_URI="http://download.plt-scheme.org/bundles/${PV}/mz/mz-${PV}-src-unix.tgz"

LICENSE="LGPL-2"
SLOT="0"
S="${WORKDIR}/mz-${PV}/src"
KEYWORDS="amd64 x86"
IUSE="perl xft"

DEPEND="perl? ( dev-lang/perl )
xft? ( x11-libs/libXft )"

RDEPEND="${DEPEND}
!dev-scheme/racket"

src_prepare() {
	epatch "${FILESDIR}/${P}-funtoo-fixes.patch"
}

src_compile()
{
	append-flags -Wa,--noexecstack
	econf $(use_enable perl) $(use_enable xft) --prefix=/usr || die "configure failed"
	emake -j1 || die "make failed"
}

# Distributed under the terms of the GNU General Public License v2

inherit flag-o-matic

DESCRIPTION="MzScheme scheme compiler"
HOMEPAGE="http://www.plt-scheme.org/software/mzscheme/"
SRC_URI="http://download.plt-scheme.org/bundles/${PV}/mz/mz-${PV}-src-unix.tgz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="perl xft"

DEPEND="perl? ( dev-lang/perl )
xft? ( virtual/xft )"

S="${WORKDIR}/mz-${PV}/src"

src_compile()
{
	append-flags -Wa,--noexecstack
	econf $(use_enable perl) $(use_enable xft) --prefix=/usr || die "configure failed"
	emake -j1 || die "make failed"
}

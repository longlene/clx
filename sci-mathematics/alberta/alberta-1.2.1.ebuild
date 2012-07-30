# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="An adaptive hierarchical finite element toolbox"
HOMEPAGE="http://www.alberta-fem.de/"
SRC_URI="http://www.alberta-fem.de/Downloads/${P/.1}.tar.gz
	http://gentooexperimental.org/~genstef/dist/${P}.patch.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sci-libs/blas-atlas
	virtual/opengl"

S="${WORKDIR}/${P/.1}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	# A working version of the 1.2.1 patch provided by upstream
	epatch "${WORKDIR}/${P}.patch"
}

src_compile() {
	# There exists no ebuild for gltools nor grape, disabling it
	econf \
		--without-gltools \
		--without-grape || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README THANKS AUTHORS NEWS
}



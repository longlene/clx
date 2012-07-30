# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Visprint makes fractal fingerprint png images based on the contents of any file"
HOMEPAGE="http://www.tastyrabbit.net/visprint/"
SRC_URI="http://www.tastyrabbit.net/visprint/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
    unpack ${A} || die "Failed to unpack ${A}"
}

src_compile() {
    emake || die "emake failed"
}

src_install() {
    dobin visprint || die "dobin yg failed"
    dodoc visprint.1.gz || die "couldn't copy man page"
}

# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit common-lisp-3 eutils

DEB_PV=4

DESCRIPTION="Common Lisp regression tester from MIT"
HOMEPAGE="http://www-2.cs.cmu.edu/afs/cs/project/ai-repository/ai/lang/lisp/code/testing/rt/
		http://packages.debian.org/unstable/devel/cl-rt.html
		http://www.cliki.net/rt"
SRC_URI="mirror://debian/pool/main/c/cl-${PN}/cl-${PN}_${PV}.orig.tar.gz
		mirror://debian/pool/main/c/cl-${PN}/cl-${PN}_${PV}-${DEB_PV}.diff.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}"

S="${WORKDIR}/cl-${P}"

src_prepare() {
	epatch "${WORKDIR}"/cl-${PN}_${PV}-${DEB_PV}.diff
	cp "${FILESDIR}"/${PN}.asd "${S}"
}

src_install() {
	common-lisp-install-sources ${PN}{,-test}.lisp
	common-lisp-install-asdf ${PN}.asd
	dodoc rt-doc.txt || die "Cannot install doc"
}

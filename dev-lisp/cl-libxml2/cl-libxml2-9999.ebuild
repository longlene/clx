# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit common-lisp-3 git-r3

DESCRIPTION="High-level Common Lisp wrapper around libxml2 and libxslt."
HOMEPAGE="http://code.google.com/p/cl-libxml2/"
SRC_URI=""

EGIT_REPO_URI="git://github.com/archimag/cl-libxml2.git"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-libs/libxml2
dev-libs/libxslt"
RDEPEND="${DEPEND}
>=dev-lisp/cffi-0.10.2
dev-lisp/iterate
dev-lisp/puri
dev-lisp/flexi-streams
dev-lisp/alexandria
>=dev-lisp/garbage-pools-0.1.2
dev-lisp/metabang-bind
dev-lisp/lift"

src_compile () {
	make -C foreign CC=$(tc-getCC) || die "Cannot build helper library"
}

src_install () {
	common-lisp-install-sources html tree xfactory xoverlay xpath xslt test
	common-lisp-install-asdf

	dolib.so foreign/cllibxml2.so

	dodoc ChangeLog
	docinto examples && dodoc examples/*
}

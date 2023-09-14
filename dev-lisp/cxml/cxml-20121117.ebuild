# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3


DESCRIPTION="A Common Lisp XML library implementing namespaces, a validating SAX-like XML 1.0 parser and the DOM Level 1 Core interfaces."
HOMEPAGE="http://common-lisp.net/project/cxml/"
SRC_URI=""
EGIT_REPO_URI="http://repo.or.cz/r/cxml.git"


LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}
		>=dev-lisp/closure-common-20081130
		dev-lisp/puri
		dev-lisp/trivial-gray-streams"

CLSYSTEMS="${PN} ${PN}-contrib"

#S="${WORKDIR}"/${PN}-${MY_PV}

src_prepare() {
	#unpack ${A}
	rm "${S}"/GNUmakefile
	cp "${FILESDIR}"/${PN}-contrib.asd "${S}"
}

src_install() {
	common-lisp-install *.{dtd,asd}
	common-lisp-install {contrib,dom,klacks,test,xml,xml/sax-tests}/*.lisp
	common-lisp-symlink-asdf

	dodoc README OLDNEWS TIMES
	dohtml doc/*.{html,css,png}
}

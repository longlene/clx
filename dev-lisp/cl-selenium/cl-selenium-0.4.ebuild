# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3

DESCRIPTION="Write your Selenium functional test cases or script your web browser in Common Lisp"
HOMEPAGE="https://common-lisp.net/project/cl-selenium/"
SRC_URI="http://common-lisp.net/project/cl-selenium/releases/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/split-sequence
	dev-lisp/puri
	dev-lisp/cl-ppcre
	dev-lisp/cxml
"

src_prepare() {
	eapply_user
	sed -e "s#/home/mkennedy/src#${CLSOURCEROOT}#" -i iedoc.lisp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all iedoc-0.8.3-1879.xml
}

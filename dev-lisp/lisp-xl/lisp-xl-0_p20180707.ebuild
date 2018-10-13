# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="47147c5035de7c1a1dfdcdd9e524295f9ec45365"

DESCRIPTION="Common Lisp Microsoft XLSX (Microsoft Excel) loader"
HOMEPAGE="https://github.com/defunkydrummer/lisp-xl"
SRC_URI="https://github.com/defunkydrummer/lisp-xl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/zip
	dev-lisp/cxml
	dev-lisp/xmls
	dev-lisp/cl-csv
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}

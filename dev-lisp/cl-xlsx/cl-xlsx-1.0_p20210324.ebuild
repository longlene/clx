# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="68537a6517f5ded86137840aa60d2fced859459f"

DESCRIPTION="Read XLSX files with Common Lisp"
HOMEPAGE="https://github.com/a1b10/cl-xlsx"
SRC_URI="https://github.com/a1b10/cl-xlsx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cxml
	dev-lisp/zip
	dev-lisp/babel
"
BDEPEND=""

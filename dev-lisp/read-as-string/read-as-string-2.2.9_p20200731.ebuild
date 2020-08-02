# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="247b5de421abb2d8d54f861e1108d9d365a10956"

DESCRIPTION="Reading S-Expression string from stream"
HOMEPAGE="https://github.com/hyotang666/read-as-string"
SRC_URI="https://github.com/hyotang666/read-as-string/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/named-readtables
	dev-lisp/core-reader
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}

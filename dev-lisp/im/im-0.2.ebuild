# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/lispnik/im/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/im
	dev-lisp/cffi
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/static-vectors
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.txt
}

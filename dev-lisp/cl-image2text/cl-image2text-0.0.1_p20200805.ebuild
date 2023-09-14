# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="74b08f61d63d90e93c98628c9dd807f7cbff2b83"

DESCRIPTION="An image-to-text converter, written in Common Lisp"
HOMEPAGE="https://github.com/ivanp7/cl-image2text"
SRC_URI="https://github.com/ivanp7/cl-image2text/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/cl-cpus
	dev-lisp/opticl
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md lisplogo_fancy_256.png roswell/image2text.ros
}

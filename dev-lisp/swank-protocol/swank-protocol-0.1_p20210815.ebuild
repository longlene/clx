# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="eb9f23916659f96514bf646bffe65ae1c8f6b1eb"

DESCRIPTION="A low-level client for Swank"
HOMEPAGE="https://github.com/eudoxia0/swank-protocol"
SRC_URI="https://github.com/eudoxia0/swank-protocol/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	app-emacs/slime
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}

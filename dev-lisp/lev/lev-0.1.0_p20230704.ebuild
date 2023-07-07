# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b43e700c726da8cf0bd1d9123eb324b65c8ddf8e"

DESCRIPTION="libev bindings for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/lev"
SRC_URI="https://github.com/fukamachi/lev/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libev
	dev-lisp/cffi
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all src README.md
}

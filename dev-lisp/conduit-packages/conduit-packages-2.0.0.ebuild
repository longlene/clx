# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Conduit packages for Common Lisp"
HOMEPAGE="https://github.com/tfeb/conduit-packages"
SRC_URI="https://github.com/tfeb/conduit-packages/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all VERSION
}

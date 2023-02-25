# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="c8b141e456efb4bce66bfd3664c3ebf6bcaf2fdf"

DESCRIPTION="Translates WebAssembly modules to C"
HOMEPAGE="https://github.com/turbolent/w2c2"
SRC_URI="https://github.com/turbolent/w2c2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}"/w2c2

src_install() {
	dobin "${BUILD_DIR}"/w2c2
	einstalldocs
}

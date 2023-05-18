# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson vcs-snapshot

EGIT_COMMIT="1bc789705057c42be32aea17aeec97763aece3c7"

DESCRIPTION="CBOR library aimed at heavily constrained devices"
HOMEPAGE="https://github.com/bergzand/NanoCBOR"
SRC_URI="https://github.com/bergzand/NanoCBOR/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local emesonargs=(
		-Denable-examples=false
		-Denable-tests=false
	)
	meson_src_configure
}

src_install() {
	insinto /usr/include
	doins -r include/nanocbor
	dolib.so ${BUILD_DIR}/libnanocbor.so
	einstalldocs
}

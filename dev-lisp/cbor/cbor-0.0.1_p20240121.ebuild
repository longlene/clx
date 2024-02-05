# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f2182edd90c4d511a256ce8589873f74db0f4050"

DESCRIPTION="A Common Lisp implementation that complies with the CBOR specification"
HOMEPAGE="https://github.com/zerodouglas/cbor"
SRC_URI="https://github.com/zerodouglas/cbor/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "cbor\/tests"/,$d' \
		-i cbor.asd
	rm -rf tests
}

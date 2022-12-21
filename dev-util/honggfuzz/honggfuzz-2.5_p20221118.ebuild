# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic vcs-snapshot

EGIT_COMMIT="25a47dfcd036f8b42ff9ddc5621df3dcf2574a2e"

DESCRIPTION="Security oriented software fuzzer"
HOMEPAGE="https://honggfuzz.dev/"
SRC_URI="https://github.com/google/honggfuzz/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-libs/libunwind"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	append-cflags -D_HF_DISASM_4_ARGS
}

src_install() {
	DESTDIR="${D}" PREFIX=/usr emake install
	einstalldocs
}

# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="5121185f92628f2d27c71f85a7df50ed18b8263a"

DESCRIPTION="tiniest x86-64-linux emulator"
HOMEPAGE="https://github.com/jart/blink"
SRC_URI="https://github.com/jart/blink/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	./configure || die "configure failed"
}

src_install() {
	dobin o/blink/blink{,enlights}
	einstalldocs
}

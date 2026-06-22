# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools vcs-snapshot

EGIT_COMMIT="9d99331eb762e9ee22fd97d15a594525ad98310a"

DESCRIPTION="a family of hash functions"
HOMEPAGE="https://github.com/google/farmhash"
SRC_URI="https://github.com/google/farmhash/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	# Makefile.am lists README but the repo only ships README.md
	ln -s README.md README || die
	eautoreconf
}

src_configure() {
	econf --disable-static
}

src_install() {
	default
	find "${D}" -name "*.la" -delete || die
}

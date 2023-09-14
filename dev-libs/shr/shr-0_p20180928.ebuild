# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools vcs-snapshot

EGIT_COMMIT="8dd76463863623d923b3fa23510dd22a146f0d11"

DESCRIPTION="A multi-process ring buffer in C"
HOMEPAGE="https://github.com/troydhanson/shr"
SRC_URI="https://github.com/troydhanson/shr/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}

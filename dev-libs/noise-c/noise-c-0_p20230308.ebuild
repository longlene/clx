# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools vcs-snapshot

EGIT_COMMIT="ffa626bddd1f8182e47c634af686108ca5049e56"

DESCRIPTION="a plain C implementation of the Noise protocol"
HOMEPAGE="https://github.com/rweather/noise-c"
SRC_URI="https://github.com/rweather/noise-c/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}

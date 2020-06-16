# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools vcs-snapshot

EGIT_COMMIT="604d48fc99b1ae349d4ceb01176a1adf83cb1b31"

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

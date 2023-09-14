# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A lightweight full-text index server with a focus on speed and efficiency"
HOMEPAGE="https://github.com/f-prime/fist"
SRC_URI="https://github.com/f-prime/fist/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin bin/fist
	dodoc README.md
}

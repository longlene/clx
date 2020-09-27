# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A tiny IRC client written in POSIX C99"
HOMEPAGE="https://github.com/mcpcpc/kirc"
SRC_URI="https://github.com/mcpcpc/kirc/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin kirc
	dodoc README.md
}

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

DESCRIPTION="Myrddin Compiler"
HOMEPAGE="https://myrlang.org/"
SRC_URI="https://myrlang.org/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

QA_EXECSTACK="usr/lib*/myr/*"

src_compile() {
	emake bootstrap all
}

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="cef2d4ebd48ab554330e49f8961547e05df47127"

DESCRIPTION=""
HOMEPAGE="https://github.com/oridb/mc"
SRC_URI="https://github.com/oridb/mc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

QA_EXECSTACK="usr/lib*/myr/*"

src_compile() {
	emake bootstrap all
}

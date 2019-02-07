# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="bff3b013c06f376b574ce42dec8d5924cea9440b"

DESCRIPTION="Easy-ISLisp"
HOMEPAGE="https://github.com/sasagawa888/eisl"
SRC_URI="https://github.com/sasagawa888/eisl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin eisl
	dodoc readme.txt
}

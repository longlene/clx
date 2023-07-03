# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="74335ff78a357866337092a9918379e34716e118"

DESCRIPTION="base16 themes for Lem editor/IDE"
HOMEPAGE="https://github.com/lukpank/lem-base16-themes"
SRC_URI="https://github.com/lukpank/lem-base16-themes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lem
"
BDEPEND=""

src_prepare() {
	default
	rm ${PN}-generate.asd
}

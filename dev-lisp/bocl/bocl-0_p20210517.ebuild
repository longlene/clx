# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="45406939c838adff0c7e62a15efe695f478dff51"

DESCRIPTION="An implementation of Common Lisp with the sole purpose of bootstrapping other implementations"
HOMEPAGE="https://github.com/robert-strandh/Bootstrap-Common-Lisp"
SRC_URI="https://github.com/robert-strandh/Bootstrap-Common-Lisp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin bocl
	dodoc README.md
}

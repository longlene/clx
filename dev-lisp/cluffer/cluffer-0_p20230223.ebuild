# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0c40c544f9e29911fffd0a0afb78b6c1b220ed28"

DESCRIPTION="General-purpose text-editor buffer"
HOMEPAGE="https://github.com/robert-strandh/Cluffer"
SRC_URI="https://github.com/robert-strandh/Cluffer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/acclimation
	dev-lisp/clump
"
BDEPEND=""

src_prepare() {
	default
	rm -rf Test
}

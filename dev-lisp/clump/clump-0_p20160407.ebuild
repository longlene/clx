# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1ea4dbac1cb86713acff9ae58727dd187d21048a"

DESCRIPTION="A collection of trees for a variety of purposes"
HOMEPAGE="https://github.com/robert-strandh/Clump"
SRC_URI="https://github.com/robert-strandh/Clump/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rm -rf Test
}

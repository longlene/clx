# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="414902c6f575818c39a8a156b8b61b1adfa73dad"

DESCRIPTION="Common Lisp testing framework blending into normal Slime development"
HOMEPAGE="https://github.com/hu-dwim/hu.dwim.stefil"
SRC_URI="https://github.com/hu-dwim/hu.dwim.stefil/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem :hu.dwim.stefil\/test/,$d' hu.dwim.stefil.asd
		rm -r test
	fi
}

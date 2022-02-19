# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="995b9ef7db7cf10dd795d6a282a16b9365db3352"

DESCRIPTION="Common Lisp encapsulation of the C Roaring Bitmap API via foreign functions"
HOMEPAGE="https://github.com/dtenny/cl-roaring"
SRC_URI="https://github.com/dtenny/cl-roaring/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-libs/croaring
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.{asd,lisp}
}

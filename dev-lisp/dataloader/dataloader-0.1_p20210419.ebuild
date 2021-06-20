# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ad58bd6bf1c143161dc4ccba11e17f455b1022fe"

DESCRIPTION="A universal file loader for various images/audio data formats in Common Lisp"
HOMEPAGE="https://github.com/guicho271828/dataloader"
SRC_URI="https://github.com/guicho271828/dataloader/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/magicffi
	dev-lisp/cl-wav
	dev-lisp/cl-png
	dev-lisp/cl-jpeg
	dev-lisp/retrospectiff
	dev-lisp/cl-csv
	dev-lisp/numpy-file-format
	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/trivia
	dev-lisp/numcl
"
BDEPEND=""

src_prepare() {
	default
	rm -r asd-generator-data.asd ${PN}.test.asd t
}

# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="93cbdf6f6fe8a2eb5f652f8adec453eb98ea0547"

DESCRIPTION="Common Lisp library for parsing MIME types"
HOMEPAGE="https://github.com/mmontone/cl-mimeparse"
SRC_URI="https://github.com/mmontone/cl-mimeparse/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/parse-number
"
BDEPEND=""

src_prepare() {
	default
	rm ${PN}-test.asd test.lisp
}

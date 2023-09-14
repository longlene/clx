# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4e5369bec6d5e4eed4f99c3dc009fce3e3427cd3"

DESCRIPTION="Scribble document syntax in Common Lisp"
HOMEPAGE="https://github.com/fare/scribble"
SRC_URI="https://github.com/fare/scribble/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/meta
	dev-lisp/fare-utils
	dev-lisp/fare-memoization
	dev-lisp/fare-quasiquote
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem "scribble\/test/,$d' ${PN}>asd
}

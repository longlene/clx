# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ef5d235f59a48f92d573f777d1dc5dd3a4b4b73a"

DESCRIPTION="A veneer for plotting in Common Lisp with Vega Lite"
HOMEPAGE="https://github.com/kilimanjaro/plotsdam"
SRC_URI="https://github.com/kilimanjaro/plotsdam/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-json
	dev-lisp/hunchentoot
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-examples.asd examples
}

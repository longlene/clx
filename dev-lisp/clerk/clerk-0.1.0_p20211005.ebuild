# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1b928178997d3d4eef6f3bae21ee79821a65520f"

DESCRIPTION="A cron-like scheduler with sane DSL"
HOMEPAGE="https://github.com/lisp-maintainers/clerk"
SRC_URI="https://github.com/lisp-maintainers/clerk/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/cl-ppcre
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:clerk-test/,$' ${PN}.asd
	rm -r t
}

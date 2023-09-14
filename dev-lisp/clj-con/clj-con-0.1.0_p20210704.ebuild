# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="82174136a33079a37cf5bcd4685ef887f0f11fe0"

DESCRIPTION="Clojure-style concurrency operations in Common Lisp"
HOMEPAGE="https://github.com/dtenny/clj-con"
SRC_URI="https://github.com/dtenny/clj-con/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"
BDEPEND=""

src_prepare() {
	default
	rm ${PN}-test.{asd,lisp}
}

# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bad89a09a75fab8e0cbec526e28934e74e27c8a2"

DESCRIPTION="Clojure-style seqs in CL"
HOMEPAGE="https://github.com/Zulu-Inuoe/seq"
SRC_URI="https://github.com/Zulu-Inuoe/seq/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/introspect-environment
	dev-lisp/cl-stream
"
BDEPEND=""

src_prepare() {
	default
	rm -rf t
}

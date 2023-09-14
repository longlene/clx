# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ff71acfd20173cd4732781216ce534d0c2ef2edf"

DESCRIPTION="HTTP/2 implementation in Common Lisp"
HOMEPAGE="https://github.com/zellerin/http2/"
SRC_URI="https://github.com/zellerin/http2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-gray-streams
	dev-lisp/flexi-streams
	dev-lisp/cl-plus-ssl
"
BDEPEND=""

# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0f0d89757554f0126b09b3346d58c29e8e91d01b"

DESCRIPTION="A templating system for Common Lisp"
HOMEPAGE="https://cl-emb.common-lisp.dev/"
SRC_URI="https://github.com/longlene/cl-emb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
"
BDEPEND=""

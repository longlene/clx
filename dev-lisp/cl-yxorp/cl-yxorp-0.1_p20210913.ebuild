# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cb0334aef37fad5fa03e92ec6c5e512ce458496e"

DESCRIPTION="A reverse proxy server written in and configurable in Common Lisp"
HOMEPAGE="https://github.com/charJe/cl-yxorp"
SRC_URI="https://github.com/charJe/cl-yxorp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/str
	dev-lisp/usocket
	dev-lisp/cl-plus-ssl
	dev-lisp/binding-arrows
	dev-lisp/flexi-streams
	dev-lisp/trivial-garbage
"
BDEPEND=""

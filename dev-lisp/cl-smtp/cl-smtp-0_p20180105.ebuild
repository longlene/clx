# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a6be003b2bbe863a56494c32fe61d9769015c3b4"

DESCRIPTION="Common Lisp smtp client"
HOMEPAGE="http://common-lisp.net/project/cl-smtp/"
SRC_URI="https://gitlab.common-lisp.net/cl-smtp/cl-smtp/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-lisp/usocket
	dev-lisp/trivial-gray-streams
	dev-lisp/flexi-streams
	dev-lisp/cl-base64
	dev-lisp/cl-plus-ssl
"


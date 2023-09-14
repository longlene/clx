# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ec97bee3431c55913078e532daae81eb0fd90372"

DESCRIPTION="A Common Lisp client library for Mastodon instances"
HOMEPAGE="https://github.com/Shinmera/tooter"
SRC_URI="https://github.com/Shinmera/tooter/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/yason
	dev-lisp/cl-ppcre
	dev-lisp/drakma
	dev-lisp/documentation-utils
"
BDEPEND=""

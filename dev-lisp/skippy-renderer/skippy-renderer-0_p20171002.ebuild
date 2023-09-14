# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="aa912ea33fcd784b58eee6603e37b1decbbb8cf7"

DESCRIPTION="GIF renderer for SKIPPY"
HOMEPAGE="https://github.com/phoe/skippy-renderer/"
SRC_URI="https://github.com/phoe/skippy-renderer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/skippy
"

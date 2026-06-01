# Copyright 2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cd92e94ff45218c3833143aaebe7522f19079cef"

DESCRIPTION="A JPEG library for Common Lisp"
HOMEPAGE="http://www.cliki.net/cl-jpeg"
SRC_URI="https://github.com/sharplispers/cl-jpeg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

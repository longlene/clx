# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bef2c3bb64dd19cb31c26338dcbecbf2542a2619"

DESCRIPTION="A JPEG library for Common Lisp"
HOMEPAGE="http://www.cliki.net/cl-jpeg"
SRC_URI="https://github.com/sharplispers/cl-jpeg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

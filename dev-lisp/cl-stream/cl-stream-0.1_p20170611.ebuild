# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="99e624f71bc04bb79ab7bee8c63a2cc787ac2c0f"

DESCRIPTION="Stream classes for Common Lisp"
HOMEPAGE="https://github.com/cl-stream/cl-stream"
SRC_URI="https://github.com/cl-stream/cl-stream/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

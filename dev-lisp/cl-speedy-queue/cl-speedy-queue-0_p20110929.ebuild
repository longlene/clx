# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0425c7c62ad3b898a5ec58cd1b3e74f7d91eec4b"

DESCRIPTION="Lightweight, optimized queue implementation for CL"
HOMEPAGE="https://github.com/zkat/cl-speedy-queue"
SRC_URI="https://github.com/zkat/cl-speedy-queue/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b1a5cb4042a887c9f2c512e21794daea562e8c80"

DESCRIPTION="Cross-package debugging facility"
HOMEPAGE="https://github.com/LowH/cl-debug"
SRC_URI="https://github.com/LowH/cl-debug/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

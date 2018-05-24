# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d4d53a1e29a360f8aaab9134da89b8c6966fe16e"

DESCRIPTION="Basic Prolog functionality for Common Lisp"
HOMEPAGE="https://github.com/wmannis/cl-gambol"
SRC_URI="https://github.com/wmannis/cl-gambol/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

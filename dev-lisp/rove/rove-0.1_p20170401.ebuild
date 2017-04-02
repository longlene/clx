# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8dae9c06b15280052a38bd7a85542cae8b0d7fa8"

DESCRIPTION="Small testing framework"
HOMEPAGE="https://github.com/fukamachi/rove"
SRC_URI="https://github.com/fukamachi/rove/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

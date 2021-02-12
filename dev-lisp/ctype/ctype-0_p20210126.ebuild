# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3fdf1bc61cc6b33680abf920d534149906d4e7fd"

DESCRIPTION="CL type system implementation"
HOMEPAGE="https://github.com/Bike/ctype"
SRC_URI="https://github.com/Bike/ctype/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

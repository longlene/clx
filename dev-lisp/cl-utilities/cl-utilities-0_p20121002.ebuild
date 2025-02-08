# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="6b4de39201d439330aec0b3589931aa3be570e66"

DESCRIPTION="A collection of semi-standard utilities"
HOMEPAGE="
	https://cl-utilities.common-lisp.dev/
	https://github.com/Publitechs/cl-utilities
"
SRC_URI="https://github.com/Publitechs/cl-utilities/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )
inherit distutils-r1 vcs-snapshot

EGIT_COMMIT="6e2b0cd9f1403ecaf164dea7019dd54db5aea252"

DESCRIPTION="Database of CPU Opcodes"
HOMEPAGE="https://github.com/Maratyszcza/Opcodes"
SRC_URI="https://github.com/Maratyszcza/Opcodes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

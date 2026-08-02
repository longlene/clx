# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

EGIT_COMMIT="82768dd20b5d000228fb86e11d183399406cc803"

DESCRIPTION="A small library to make it easier to store dictionary data persistently"
HOMEPAGE="https://github.com/mikemalinowski/scribble"
SRC_URI="https://github.com/mikemalinowski/scribble/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/scribble-${EGIT_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

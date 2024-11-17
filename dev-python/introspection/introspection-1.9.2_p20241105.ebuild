# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="e6665dbdb5afdcba1a6e2cd6ee550c67a0772d4f"

DESCRIPTION="New and improved introspection functions"
HOMEPAGE="https://github.com/Aran-Fey/introspection"
SRC_URI="https://github.com/Aran-Fey/introspection/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/ordered-set[${PYTHON_USEDEP}]
	dev-python/sentinel[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

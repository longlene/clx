# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 vcs-snapshot

EGIT_COMMIT="53a690ebf297d1db5680189c3ebd58f06d859633"

DESCRIPTION="Common Lisp for Python"
HOMEPAGE="
	https://pypi.org/project/cl4py/
	https://github.com/marcoheisig/cl4py
"
SRC_URI="https://github.com/marcoheisig/cl4py/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-lisp/sbcl
	dev-python/numpy[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

CRFSUITE_COMMIT="dc5b6c7b726de90ca63cbf269e6476e18f1dd0d9"
LIBLBFGS_COMMIT="57678b188ae34c2fb2ed36baf54f9a58b4260d1c"

DESCRIPTION="A python binding for crfsuite"
HOMEPAGE="
	https://pypi.org/project/python-crfsuite/
	https://github.com/scrapinghub/python-crfsuite
"
SRC_URI="
	https://github.com/scrapinghub/python-crfsuite/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/chokkan/crfsuite/archive/${CRFSUITE_COMMIT}.tar.gz -> crfsuite-${CRFSUITE_COMMIT}.tar.gz
	https://github.com/chokkan/liblbfgs/archive/${LIBLBFGS_COMMIT}.tar.gz -> liblbfgs-${LIBLBFGS_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

src_prepare() {
	default
	rmdir crfsuite && ln -sv "${WORKDIR}"/crfsuite-${CRFSUITE_COMMIT} crfsuite
	rmdir liblbfgs && ln -sv "${WORKDIR}"/liblbfgs-${LIBLBFGS_COMMIT} liblbfgs
	distutils-r1_src_prepare
}

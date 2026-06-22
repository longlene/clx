# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 vcs-snapshot

EGIT_COMMIT="ad7f9dc7e9b0e88a08d0cefd1442f4ab1dd1779b"

DESCRIPTION="Levenshtein and Hamming distance computation"
HOMEPAGE="
	https://pypi.org/project/distance/
	https://github.com/doukremt/distance
"
SRC_URI="https://github.com/doukremt/distance/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

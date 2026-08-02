# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Extract the top-level domain (TLD) from the URL given"
HOMEPAGE="https://github.com/barseghyanartur/tld https://pypi.org/project/tld/"
SRC_URI="https://github.com/barseghyanartur/tld/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="|| ( MPL-1.1 GPL-2 LGPL-2.1+ )"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	dev-python/setuptools-scm
"

RESTRICT="test"

src_prepare() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_src_prepare
}

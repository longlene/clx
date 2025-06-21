# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="SSH/SFTP implementation for fsspec"
HOMEPAGE="
	https://pypi.org/project/sshfs/
	https://github.com/fsspec/sshfs
"
SRC_URI="https://github.com/fsspec/sshfs/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/fsspec-2021.8.1[${PYTHON_USEDEP}]
	>=dev-python/asyncssh-2.11.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${PN^^}=${PV}

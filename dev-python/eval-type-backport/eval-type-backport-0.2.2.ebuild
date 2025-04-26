# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Like typing._eval_type, but lets older Python versions use newer typing features"
HOMEPAGE="
	https://pypi.org/project/eval-type-backport/
	https://github.com/alexmojaki/eval_type_backport
"
SRC_URI="https://github.com/alexmojaki/eval_type_backport/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

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

S="${WORKDIR}"/eval_type_backport-${PV}

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_EVAL_TYPE_BACKPORT="${PV}"

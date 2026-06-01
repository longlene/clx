# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14}  )

inherit distutils-r1

DESCRIPTION="Like typing._eval_type, but lets older Python versions use newer typing features"
HOMEPAGE="
	https://pypi.org/project/eval-type-backport/
	https://github.com/alexmojaki/eval_type_backport
"
SRC_URI="https://github.com/alexmojaki/eval_type_backport/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/eval_type_backport-${PV}
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_EVAL_TYPE_BACKPORT="${PV}"

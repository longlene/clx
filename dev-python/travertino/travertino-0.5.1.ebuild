# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

MY_PN="toga"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A set of constants and base classes for describing user interface layouts"
HOMEPAGE="
	https://pypi.org/project/toga/
	https://github.com/beeware/toga/
"
SRC_URI="https://github.com/beeware/toga/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${MY_P}/travertino

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_TRAVERTINO="${PV}"

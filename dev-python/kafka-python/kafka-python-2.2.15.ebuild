# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Python client for Apache Kafka"
HOMEPAGE="
	https://pypi.org/project/kafka-python/
	https://github.com/dpkp/kafka-python
"
SRC_URI="https://github.com/dpkp/kafka-python/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	default
	rm -rf test
	distutils-r1_src_prepare
}

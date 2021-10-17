# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Apache Beam SDK for Python"
HOMEPAGE="https://beam.apache.org/"
SRC_URI="mirror://apache/beam/${PV}/${P}-python.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/pip"
RDEPEND="${DEPEND}"

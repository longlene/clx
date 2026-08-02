# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Type stubs for mongoengine w/ basic support for bson and pymongo"
HOMEPAGE="https://github.com/sbdchd/mongo-types"
SRC_URI="https://files.pythonhosted.org/packages/91/40/e79a6caceb8140326963b4ea8829dd8df0434dc815312430b4518bf80c26/mongo-types-${PV}.tar.gz"

S="${WORKDIR}/mongo-types-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="a set of extensions to Ian Bicking's virtualenv tool for creating isolated Python development environments."
HOMEPAGE="http://www.doughellmann.com/projects/virtualenvwrapper/"
SRC_URI="http://pypi.python.org/packages/source/v/virtualenvwrapper/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/virtualenv"
RDEPEND="${DEPEND}"


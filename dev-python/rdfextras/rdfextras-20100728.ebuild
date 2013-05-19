# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_P="${PN}-hgsnapshot-${PV}"

DESCRIPTION="A collection of extra utilities based on RDFLib, including support for SPARQL"
HOMEPAGE="http://code.google.com/p/rdfextras/"
SRC_URI="http://rdfextras.googlecode.com/files/${MY_P}.zip"

LICENSE="BSD"
SLOT="0"
# Should also work on ~x86 and ~x86-linux, which are the other arches already
# supported by dev-python/rdflib package. However, I can't test on them.
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/rdflib
	dev-python/pyparsing"
DEPEND="${DEPEND}
	app-arch/unzip"

# The tests are bugged.
RESTRICT="test"

S="${WORKDIR}/${MY_P}"

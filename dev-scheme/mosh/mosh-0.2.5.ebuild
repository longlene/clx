# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:$

EAPI=2

inherit base

DESCRIPTION="Scheme R6RS interpreter"
HOMEPAGE="http://code.google.com/p/mosh-scheme/"
SRC_URI="http://mosh-scheme.googlecode.com/files/${P}-1.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

DOCS=( "doc/README.nmosh" "doc/RELNOTE" )
HTML_DOCS=( "doc/html/" )

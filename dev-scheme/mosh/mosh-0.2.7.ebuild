# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:$

EAPI=5

inherit base

DESCRIPTION="Scheme R6RS interpreter"
HOMEPAGE="http://code.google.com/p/mosh-scheme/"
SRC_URI="https://github.com/higepon/mosh/archive/mosh-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

DOCS=( "doc/README.nmosh" "doc/RELNOTE" )
HTML_DOCS=( "doc/html/" )

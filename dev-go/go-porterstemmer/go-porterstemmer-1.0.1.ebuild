# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/reiver/go-porterstemmer"

DESCRIPTION="A native Go clean room implementation of the Porter Stemming algorithm"
HOMEPAGE="https://github.com/reiver/go-porterstemmer"
SRC_URI="https://github.com/reiver/go-porterstemmer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/andelf/go-curl"
EGIT_COMMIT="f8b334df3789fbdf98df3b3b22815e958b956c19"

DESCRIPTION="golang curl(libcurl) binding"
HOMEPAGE="https://github.com/andelf/go-curl"
SRC_URI="https://github.com/andelf/go-curl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	net-misc/curl
"
RDEPEND="${DEPEND}"

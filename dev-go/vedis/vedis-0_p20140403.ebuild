# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/icholy/vedis"
EGIT_COMMIT="c1fec7cb3c7d89fb0662b557e64f53bec588dd54"

DESCRIPTION="CGO bindings to Vedis"
HOMEPAGE="https://github.com/icholy/vedis"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

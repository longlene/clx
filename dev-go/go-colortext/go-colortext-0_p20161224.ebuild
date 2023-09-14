# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/daviddengcn/go-colortext"
EGIT_COMMIT="805cee6e0d43c72ba1d4e3275965ff41e0da068a"

DESCRIPTION="Change the color of console text"
HOMEPAGE="https://github.com/daviddengcn/go-colortext"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

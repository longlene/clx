# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/logrusorgru/aurora"
EGIT_COMMIT="962a6974312dde57d1f6f5738b4f83e1af9f38a4"

DESCRIPTION="Golang ultimate ANSI-colors that supports Printf/Sprintf methods"
HOMEPAGE="https://github.com/logrusorgru/aurora"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/mmcdole/goxpp"
EGIT_COMMIT="e38884aa48c1952a416ba35f3c276e4f02f9b40e"

DESCRIPTION="Go XML Pull Parser"
HOMEPAGE="https://github.com/mmcdole/goxpp"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

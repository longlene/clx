# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/yhat/scrape"
EGIT_COMMIT="24b7890b0945459dbf91743e4d2ac5d75a51fee2"

DESCRIPTION="A simple, higher level interface for Go web scraping"
HOMEPAGE="https://github.com/yhat/scrape"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

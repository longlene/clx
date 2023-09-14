# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/bunsenapp/go-selenium"

DESCRIPTION="Selenium web driver library written in Go"
HOMEPAGE="https://github.com/bunsenapp/go-selenium"
SRC_URI="https://github.com/bunsenapp/go-selenium/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

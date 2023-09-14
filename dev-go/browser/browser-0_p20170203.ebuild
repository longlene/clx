# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/pkg/browser"
EGIT_COMMIT="8189194c9f158043d6d45a0b939a47a924ea4b13"

DESCRIPTION="Package browser provides helpers to open files, readers, and urls in a browser window"
HOMEPAGE="https://github.com/pkg/browser"
SRC_URI="https://github.com/pkg/browser/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

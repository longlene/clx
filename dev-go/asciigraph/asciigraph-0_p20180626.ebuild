# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/guptarohit/asciigraph"
EGIT_COMMIT="ac93c63bf1bb3bcee769aa858208ff9f9327d4fe"

DESCRIPTION="Go package to make lightweight ASCII line graph"
HOMEPAGE="https://github.com/guptarohit/asciigraph"
SRC_URI="https://github.com/guptarohit/asciigraph/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

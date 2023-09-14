# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/docker/go-p9p"
EGIT_COMMIT="87ae8514a3a2d9684994a6c319f96ba9e18a062e"

DESCRIPTION="A modern, performant 9P library for Go"
HOMEPAGE="https://github.com/docker/go-p9p"
SRC_URI="https://github.com/docker/go-p9p/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/go-chi/chi"

DESCRIPTION="lightweight, idiomatic and composable router for building Go HTTP services"
HOMEPAGE="https://github.com/go-chi/chi"
SRC_URI="https://github.com/go-chi/chi/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

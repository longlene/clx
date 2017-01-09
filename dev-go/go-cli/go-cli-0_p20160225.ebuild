# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/motemen/go-cli"
EGIT_COMMIT="c859ad8358c0914bb6f913c49a0b3e84b7543f33"

DESCRIPTION="Yet another CLI app builder with commands, based on documentation"
HOMEPAGE="https://github.com/motemen/go-cli"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

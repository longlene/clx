# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/valyala/fasttemplate"
EGIT_COMMIT="d090d65668a286d9a180d43a19dfdc5dcad8fe88"

DESCRIPTION="Simple and fast template engine for Go"
HOMEPAGE="https://github.com/valyala/fasttemplate"
SRC_URI="https://github.com/valyala/fasttemplate/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

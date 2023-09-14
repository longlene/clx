# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="an efficient quadtree library for detecting collisions between axis-aligned bounding-boxes"
HOMEPAGE="https://gitlab.com/dto/quadrille"
SRC_URI="https://gitlab.com/dto/quadrille/repository/archive.tar.gz?ref=${P} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

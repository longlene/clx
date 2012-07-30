# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Virtual for Geant-3"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="3"
KEYWORDS="~x86 ~amd64"
IUSE="vmc"

DEPEND=""
RDEPEND="vmc? ( sci-physics/geant3-vmc ) 
		|| ( sci-physics/geant:3 sci-physics/geant3-vmc )"

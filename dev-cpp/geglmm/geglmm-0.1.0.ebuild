# Copyright 2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit eutils gnome2

DESCRIPTION="C++ interface for GEGL"
HOMEPAGE="http://www.gnome.org/projects/geglmm"

LICENSE="GPL-2"
SLOT="1"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/gegl"

DEPEND="${RDEPEND}"

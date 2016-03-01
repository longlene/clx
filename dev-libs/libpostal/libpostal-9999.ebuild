# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools git-2

DESCRIPTION="A C library for parsing/normalizing street addresses around the world"
HOMEPAGE="https://github.com/openvenues/libpostal"
SRC_URI=""

EGIT_REPO_URI="https://github.com/openvenues/libpostal.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="app-arch/snappy"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

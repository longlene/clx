# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="C++ convolutional neural network"
HOMEPAGE="https://github.com/gnawice/mojo-cnn"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gnawice/mojo-cnn.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r mojo
	dodoc -r data examples models README.md
}

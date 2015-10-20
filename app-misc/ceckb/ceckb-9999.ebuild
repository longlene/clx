# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="libcec to uinput key event mapper"
HOMEPAGE="http://git.2f30.org/ceckb/"
SRC_URI=""

EGIT_REPO_URI="git://git.2f30.org/ceckb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-libs/libcec"
RDEPEND="${DEPEND}"

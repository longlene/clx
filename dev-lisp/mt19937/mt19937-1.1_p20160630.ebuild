# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="78f041951e0be50cad13df344df6bdc1c674a9e1"

DESCRIPTION="Portable MT19937 Mersenne Twister random number generator"
HOMEPAGE="https://github.com/DruidGreeneyes/MT19937"
SRC_URI="https://github.com/DruidGreeneyes/MT19937/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

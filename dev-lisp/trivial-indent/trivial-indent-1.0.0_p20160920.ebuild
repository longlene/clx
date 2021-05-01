# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ba4ce8028cf40b6a258e46eb793378c6a0c5af75"

DESCRIPTION="A very simple library to allow indentation hints for SWANK"
HOMEPAGE="https://github.com/Shinmera/trivial-indent"
SRC_URI="https://github.com/Shinmera/trivial-indent/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

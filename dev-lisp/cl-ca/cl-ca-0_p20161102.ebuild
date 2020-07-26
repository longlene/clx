# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6e1868accfdffc2b1ee92c12b208963eda16aab1"

DESCRIPTION="A common lisp library for simply implementing programs using cellular automata"
HOMEPAGE="https://github.com/lukasepple/cl-ca/"
SRC_URI="https://github.com/lukasepple/cl-ca/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5a81c3a6d39b0506189c69597fb22d3dd3590a52"

DESCRIPTION="Tiny CL library to retrieve the arguments list of a function"
HOMEPAGE="https://github.com/Shinmera/trivial-arguments"
SRC_URI="https://github.com/Shinmera/trivial-arguments/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A promise implementation for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/blackbird/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/blackbird.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

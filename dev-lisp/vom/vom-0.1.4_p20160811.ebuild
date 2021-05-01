# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1aeafeb5b74c53741b79497e0ef4acf85c92ff24"

DESCRIPTION="A tiny logging library for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/vom"
SRC_URI="https://github.com/orthecreedence/vom/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

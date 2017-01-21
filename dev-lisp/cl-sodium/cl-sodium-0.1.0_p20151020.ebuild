# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8223e0a958f59e991140a08a15cd4b7bc0a15b8e"

DESCRIPTION="A wrapper around libsodium, providing easy, correct, safe crypto for common lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-sodium"
SRC_URI="https://github.com/orthecreedence/cl-sodium/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-libs/libsodium
"

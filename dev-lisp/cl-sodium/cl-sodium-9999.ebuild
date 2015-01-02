# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A wrapper around libsodium, providing easy, correct, safe crypto for common lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-sodium"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/cl-sodium.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-libs/libsodium"

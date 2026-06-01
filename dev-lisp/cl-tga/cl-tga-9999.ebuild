# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="TAG file loader in common lisp"
HOMEPAGE="https://github.com/fisxoj/cl-tga"

EGIT_REPO_URI="https://github.com/fisxoj/cl-tga.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"

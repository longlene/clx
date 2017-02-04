# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="17216acb73e8b60ea2b57875829115838373a5b1"

DESCRIPTION="Low-level utilities used by all of Kenny's projects"
HOMEPAGE="https://github.com/kennytilton/utils-kt"
SRC_URI="https://github.com/kennytilton/utils-kt/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

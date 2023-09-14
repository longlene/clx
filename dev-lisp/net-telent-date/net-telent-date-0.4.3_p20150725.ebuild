# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="29e3428d2ba4b95864f1e15220ca3daca6ed0bfd"

DESCRIPTION="Common Lisp utilities for printing and parsing date"
HOMEPAGE="http://packages.debian.org/unstable/devel/cl-net-telent-date
	http://www.cliki.net/net-telent-date"
SRC_URI="http://github.com/eugeneia/net-telent-date/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND=""


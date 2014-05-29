# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-3 git-2 eutils

DESCRIPTION="Common Lisp utilities for printing and parsing date"
HOMEPAGE="http://packages.debian.org/unstable/devel/cl-net-telent-date
	http://www.cliki.net/net-telent-date"
SRC_URI=""

EGTI_URI="http://mr.gy/maintenance/net-telent-date/net-telent-date.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}"

#S="${WORKDIR}"/cl-${P}

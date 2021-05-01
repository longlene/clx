# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Common Lisp NFS client and server"
HOMEPAGE="https://github.com/fjames86/nefarious"
SRC_URI="https://github.com/fjames86/nefarious/archive/nfs-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/frpc
	dev-lisp/cl-fad
	dev-lisp/trivial-grap-streams
	dev-lisp/cffi
"

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp SOAP Package"
HOMEPAGE="https://github.com/mmaul/cl-soap/"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/mmaul/cl-soap.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp Latent Semantic Indexing library"
HOMEPAGE="https://github.com/melisgl/lassie"

EGIT_REPO_URI="https://github.com/melisgl/lassie.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
	dev-lisp/fsvd
"

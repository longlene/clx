# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit npm

DESCRIPTION="send text/html emails and attachments from node.js "
HOMEPAGE="https://github.com/eleith/emailjs"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/bufferjs
	dev-nodejs/starttls
	dev-nodejs/moment
	dev-nodejs/mimelib
	dev-nodejs/addressparser
"

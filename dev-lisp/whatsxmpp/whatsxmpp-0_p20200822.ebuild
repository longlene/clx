# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="acfa5c236dea8abedb6ab01fb55e7cd35b13e8ca"

DESCRIPTION="A WhatsApp (Web) transport for XMPP"
HOMEPAGE="https://git.theta.eu.org/eta/whatsxmpp"
SRC_URI="https://git.theta.eu.org/eta/whatsxmpp/archive/acfa5c236dea8abedb6ab01fb55e7cd35b13e8ca.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/bordeaux-threads
	dev-lisp/event-emitter
	dev-lisp/blackbird
	dev-lisp/cxml
	dev-lisp/ironclad
	dev-lisp/uuid
	dev-lisp/sqlite
	dev-lisp/whatscl
	dev-lisp/drakma
	dev-lisp/local-time
	dev-lisp/trivial-timers
	dev-lisp/trivial-backtrace
	dev-lisp/trivial-mimes
"
BDEPEND=""

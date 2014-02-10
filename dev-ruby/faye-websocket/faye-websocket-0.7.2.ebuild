# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/pry/pry-0.9.11.4.ebuild,v 1.1 2013/01/20 13:41:55 graaff Exp $

EAPI=5

USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Standards-compliant WebSocket server and client"
HOMEPAGE="http://github.com/faye/faye-websocket-ruby"
IUSE=""
SLOT="0"

LICENSE="MIT"
KEYWORDS="~amd64 ~ppc64 ~x86"

ruby_add_rdepend "
>=dev-ruby/eventmachine-1.0.3
>=dev-ruby/websocket-driver-0.3.1"


# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/pry/pry-0.9.11.4.ebuild,v 1.1 2013/01/20 13:41:55 graaff Exp $

EAPI=7

USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Cramp is a framework for developing asynchronous web applications"
HOMEPAGE="http://cramp.in/"
IUSE=""
SLOT="0"

LICENSE="MIT"
KEYWORDS="~amd64 ~ppc64 ~x86 ~arm"

ruby_add_rdepend "
>=dev-ruby/activesupport-3.2.16
>=dev-ruby/eventmachine-1.0.3
>=dev-ruby/faye-websocket-0.7.1
>=dev-ruby/rack-1.5.2
>=dev-ruby/thor-0.18.0"


# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/turbolinks/turbolinks-2.2.2.ebuild,v 1.1 2014/05/04 07:21:01 graaff Exp $

EAPI=5
USE_RUBY="ruby23 ruby24"

# The gem does not contain runnable tests.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Action caching for Action Pack"
HOMEPAGE="https://github.com/rails/actionpack-action_caching"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

ruby_add_rdepend ">=dev-ruby/actionpack-4.0.0"

# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/pry/pry-0.9.11.4.ebuild,v 1.1 2013/01/20 13:41:55 graaff Exp $

EAPI=8

USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Prolog-ish Ruby DSL"
HOMEPAGE="https://github.com/preston/ruby-prolog"
IUSE=""
SLOT="0"

LICENSE="Apache-2"
KEYWORDS="~amd64 ~ppc64 ~x86 ~arm"

ruby_add_rdepend "
	>=dev-ruby/coderay-1.0.5
	>=dev-ruby/slop-3.4.1:3
	>=dev-ruby/method_source-0.8"

ruby_add_bdepend "test? ( >=dev-ruby/bacon-1.1 >=dev-ruby/open4-1.3 )"

all_ruby_prepare() {
	# Avoid unneeded dependency on git.
	sed -i -e '/git ls-files/d' ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_test() {
	${RUBY} -S bacon -Ispec -q spec/*_spec.rb spec/*/*_spec.rb || die
}

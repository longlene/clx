# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI=5

#USE_RUBY="ruby19 ruby20 ruby21 jruby"
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pry is a powerful alternative to the standard IRB shell for Ruby"
HOMEPAGE="https://github.com/pry/pry/wiki"
SRC_URI="https://github.com/pry/pry/archive/v${PV}.tar.gz -> ${P}.tar.gz"
IUSE=""
#SLOT="ruby19"
SLOT="ruby20"

LICENSE="MIT"
KEYWORDS="~amd64 ~ppc64 ~x86"

ruby_add_rdepend "
>=dev-ruby/coderay-1.1.0
>=dev-ruby/slop-3.4.1:3
>=dev-ruby/method_source-0.8"

ruby_add_bdepend "
test? (
>=dev-ruby/bacon-1.2
dev-ruby/gist
>=dev-ruby/open4-1.3
>=dev-ruby/rake-0.9
>=dev-ruby/mocha-1.0.0
)"

all_ruby_prepare() {
	# Avoid unneeded dependency on git.
	# Loosen coderay dependency.
	sed -e '/git ls-files/d' \
		-e '/coderay/s/~>/>=/' \
		-e '/bundler/d' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
	sed -e 's#bundler/setup#bacon#' -e "1irequire 'mocha/api'\ " -e '/Bundler/d' -e "2irequire 'json/add/ostruct' " -i spec/helper.rb || die
}

each_ruby_test() {
	${RUBY} -S bacon -Ispec -Ilib -q spec/*_spec.rb spec/*/*_spec.rb || die
}


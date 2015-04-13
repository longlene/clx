# Copyright 1999-2013 Gentoo Foundation

EAPI=4
USE_RUBY="ruby18 ruby19 ruby20 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Office Open XML Spreadsheet Generation"
HOMEPAGE="https://github.com/randym/axslx"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}
>=dev-ruby/htmlentities-4.3.1
>=dev-ruby/nokogiri-1.4.1
>=dev-ruby/rubyzip-1.0.0"

#all_ruby_prepare() {
#	# Existing metadata causes a crash in jruby, so use our own.
#	rm ../metadata || die "Unable to remove metadata."
#}
#
#each_ruby_test() {
#	${RUBY} -Ctest test_gnuplot.rb || die
#}

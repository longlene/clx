# Copyright 1999-2013 Gentoo Foundation

EAPI=4
USE_RUBY="ruby19 ruby20 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Arrange an array aligned in columns vertically or horizontally"
HOMEPAGE="https://github.com/rocky/columnize"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}"

#all_ruby_prepare() {
#	# Existing metadata causes a crash in jruby, so use our own.
#	rm ../metadata || die "Unable to remove metadata."
#}
#
#each_ruby_test() {
#	${RUBY} -Ctest test_gnuplot.rb || die
#}

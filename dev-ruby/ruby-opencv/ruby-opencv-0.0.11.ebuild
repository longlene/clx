# Copyright 1999-2013 Gentoo Foundation

EAPI=4
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="ruby-opencv is a wrapper of OpenCV for Ruby"
HOMEPAGE="https://github.com/ruby-opencv/ruby-opencv/"

LICENSE="BSD"
KEYWORDS="~amd64 ~ppc ~x86 ~arm"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}
media-libs/opencv
dev-ruby/hoe
dev-ruby/hoe-gemspec
dev-ruby/rake-compiler
dev-ruby/rdoc"

#all_ruby_prepare() {
#	# Existing metadata causes a crash in jruby, so use our own.
#	rm ../metadata || die "Unable to remove metadata."
#}
#
#each_ruby_test() {
#	${RUBY} -Ctest test_gnuplot.rb || die
#}

# Copyright 1999-2013 Gentoo Foundation

EAPI=8
USE_RUBY="ruby18 ruby19 ruby20 ruby21 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="ROpenCV is a ffi ruby binding for the Open Source Computer Vision Library OpenCV"
HOMEPAGE="http://www.ropencv.aduda.eu/"

LICENSE="BSD"
KEYWORDS="~amd64 ~ppc ~x86 ~arm"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}
>=dev-ruby/ffi-1.9.0
>=dev-ruby/rbind-0.0.23"

#all_ruby_prepare() {
#	# Existing metadata causes a crash in jruby, so use our own.
#	rm ../metadata || die "Unable to remove metadata."
#}
#
#each_ruby_test() {
#	${RUBY} -Ctest test_gnuplot.rb || die
#}

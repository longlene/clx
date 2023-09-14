# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Edward Rosten's FAST keypoint detector algorithm, as a plug-in for OpenCV-FFI"
HOMEPAGE="http://github.com/amarburg/opencv-ffi-fast"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nice-ffi-0"
ruby_add_rdepend ">=dev-ruby/mkrf-0"
ruby_add_rdepend ">=dev-ruby/opencv-ffi-0"


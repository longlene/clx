# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="OpenCV is a great library for writing Computer Vision software, However, OpenCV's HSV format is different than what you would expect! This gem trys to learn HSV color range from sample images for your OpenCV program to detect color"
HOMEPAGE="https://github.com/xli/opencv-color"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ruby-opencv-0.0.13"
ruby_add_rdepend ">=dev-ruby/statsample-1.4.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/rake-10.0"


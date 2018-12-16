# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="FasterPath is a reimplementation of Pathname for better performance"
HOMEPAGE="https://github.com/danielpclark/faster_path"

LICENSE="MIT OR Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.9"
ruby_add_rdepend ">=dev-ruby/bundler-1.12"
ruby_add_rdepend ">=dev-ruby/method_source-0.8.2"
ruby_add_rdepend ">=dev-ruby/rake-11.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.8"
ruby_add_rdepend ">=dev-ruby/minitest-reporters-1.1"
ruby_add_rdepend ">=dev-ruby/color_pound_spec_reporter-0.0.5"


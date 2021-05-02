# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Mittsu makes 3D graphics easier by providing an abstraction over OpenGL, and is based heavily off of THREE"
HOMEPAGE="https://github.com/jellymann/mittsu"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/opengl-bindings-1.5"
ruby_add_rdepend ">=dev-ruby/ffi-1.9"
ruby_add_rdepend ">=dev-ruby/rmagick-2.15"
ruby_add_rdepend ">=dev-ruby/bundler-1.9"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/minitest-5.7"
ruby_add_rdepend ">=dev-ruby/minitest-reporters-1.1"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/benchmark-ips-2.3"


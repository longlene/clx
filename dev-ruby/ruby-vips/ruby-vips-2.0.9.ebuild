# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="ruby-vips is a binding for the vips image processing library"
HOMEPAGE="http://github.com/jcupitt/ruby-vips"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.9"
ruby_add_rdepend ">=dev-ruby/rake-11.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.3"
ruby_add_rdepend ">=dev-ruby/yard-0.9.11"
ruby_add_rdepend ">=dev-ruby/redcarpet-3.3"
ruby_add_rdepend ">=dev-ruby/github-markup-1.4"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"


# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Neat is a fluid grid framework built with Bourbon with the aim of being easy
enough to use out of the box and flexible enough to customize down the road"
HOMEPAGE="http://neat.bourbon.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sass-3.3"
ruby_add_rdepend ">=dev-ruby/bourbon-4.0"
ruby_add_rdepend ">=dev-ruby/scss_lint-0.43"
ruby_add_rdepend ">=dev-ruby/aruba-0.5.0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/css_parser-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0.9.1"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"


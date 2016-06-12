# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Bourbon is a library of pure Sass mixins that are designed to be simple and easy
to use"
HOMEPAGE="http://bourbon.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sass-3.4"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/aruba-0.6.2"
ruby_add_rdepend ">=dev-ruby/css_parser-1.3"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/rspec-3.3"
ruby_add_rdepend "=dev-ruby/scss_lint-0.41"


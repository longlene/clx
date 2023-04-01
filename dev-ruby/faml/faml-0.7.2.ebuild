# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Faster implementation of Haml template language"
HOMEPAGE="https://github.com/eagletmt/faml"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/escape_utils-0"
ruby_add_rdepend ">=dev-ruby/haml_parser-0.4.0"
ruby_add_rdepend ">=dev-ruby/parser-0"
ruby_add_rdepend ">=dev-ruby/temple-0.7.0"
ruby_add_rdepend ">=dev-ruby/tilt-0"
ruby_add_rdepend ">=dev-ruby/appraisal-0"
ruby_add_rdepend ">=dev-ruby/benchmark-ips-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/coffee-script-0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/haml-4.1.0"
ruby_add_rdepend ">=dev-ruby/hamlit-0.6.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.3"
ruby_add_rdepend ">=dev-ruby/rubocop-0"
ruby_add_rdepend ">=dev-ruby/sass-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.9.0"
ruby_add_rdepend ">=dev-ruby/slim-0"


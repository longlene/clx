# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A fun role-playing game in the form of a RubyGem!"
HOMEPAGE="http://rubygems.org/gems/gemwarrior"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/os-0.9"
ruby_add_rdepend ">=dev-ruby/matrext-0.2"
ruby_add_rdepend ">=dev-ruby/http-0.8.10"
ruby_add_rdepend ">=dev-ruby/json-1.8.2"
ruby_add_rdepend ">=dev-ruby/pry-byebug-3.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.8"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.29"


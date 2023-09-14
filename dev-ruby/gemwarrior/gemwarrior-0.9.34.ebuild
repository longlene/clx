# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A fun text adventure in the form of a RubyGem!"
HOMEPAGE="http://rubygems.org/gems/gemwarrior"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/os-0.9"
ruby_add_rdepend ">=dev-ruby/http-0.8.10"
ruby_add_rdepend ">=dev-ruby/json-1.8.2"
ruby_add_rdepend ">=dev-ruby/colorize-0.7.7"
ruby_add_rdepend ">=dev-ruby/matrext-0.4.8"
ruby_add_rdepend ">=dev-ruby/clocker-0.1.2"
ruby_add_rdepend ">=dev-ruby/win32-sound-0.6.0"
ruby_add_rdepend ">=dev-ruby/feep-0.1.3"
ruby_add_rdepend ">=dev-ruby/github_api-0.12.4"
ruby_add_rdepend ">=dev-ruby/pry-byebug-3.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.8"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.29"


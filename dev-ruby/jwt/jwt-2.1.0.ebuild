# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard"
HOMEPAGE="http://github.com/jwt/ruby-jwt"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/simplecov-json-0"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0"
ruby_add_rdepend ">=dev-ruby/codacy-coverage-0"
ruby_add_rdepend ">=dev-ruby/rbnacl-0"


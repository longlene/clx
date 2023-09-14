# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby library for declaring, composing and executing GraphQL queries"
HOMEPAGE="https://github.com/github/graphql-client"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/graphql-1.2"
ruby_add_rdepend ">=dev-ruby/actionpack-3.2.22"
ruby_add_rdepend ">=dev-ruby/minitest-5.9"
ruby_add_rdepend ">=dev-ruby/rake-11.2"
ruby_add_rdepend ">=dev-ruby/rubocop-0.42"


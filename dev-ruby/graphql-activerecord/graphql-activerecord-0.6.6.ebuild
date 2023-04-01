# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Build Relay-compatible GraphQL schemas based on ActiveRecord models"
HOMEPAGE="http://github.com/goco-inc/graphql-activerecord"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/graphql-0.12.0"
ruby_add_rdepend ">=dev-ruby/graphql-relay-0.8.0"


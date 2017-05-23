# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides a interface for generating posts as a repost from external feeds"
HOMEPAGE="https://github.com/zealot128/jekyll-reposter"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/feedzirra-0"
ruby_add_rdepend ">=dev-ruby/curb-0.8"
ruby_add_rdepend ">=dev-ruby/stringex-0"
ruby_add_rdepend ">=dev-ruby/sanitize-0"


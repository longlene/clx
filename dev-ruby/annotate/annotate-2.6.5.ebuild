# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema"
HOMEPAGE="http://github.com/ctran/annotate_models"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-2.3.0"
ruby_add_rdepend ">=dev-ruby/rake-0.8.7"


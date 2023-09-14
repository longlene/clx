# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Active Record's Session Store extracted from Rails"
HOMEPAGE="http://www.rubyonrails.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-4.0.0"
ruby_add_rdepend ">=dev-ruby/actionpack-4.0.0"
ruby_add_rdepend ">=dev-ruby/railties-4.0.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"


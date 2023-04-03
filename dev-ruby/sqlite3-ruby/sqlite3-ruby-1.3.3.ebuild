# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This module allows Ruby programs to interface with the SQLite3
database engine (http://www"
HOMEPAGE="http://github.com/luislavena/sqlite3-ruby"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.3"
ruby_add_rdepend ">=dev-ruby/hoe-2.8.0"

